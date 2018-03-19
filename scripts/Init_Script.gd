# Extend the current nodes functionality.
extends Spatial

#Switch to allow or disallow the instancing of the collision spheres.
var Coll_Sphere_Switch = false

################################################################
#							READY							   #
################################################################
func _ready():
	#Set the window title.
	OS.set_window_title("Godot 3.x FPC Base")

	#Set the mouse to be captured by the program.
	#Using "MOUSE_MODE_CAPTURED" doesn't work for some reason. I'll figure that out sometime later.
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	#Enable unhandled input.
	#Unhandled input is any input not used by something else. For instance, if a menu is open, pressing "Space" won't
	#	make the player jump.
	set_process_unhandled_input(true)

	#	COLLISION SPHERES	#
	#For setting up the collision spheres, we are going to use an array to more easily keep track of them.
	#	Also, we need to use an array when connecting the signals to the player, so that when the player script emits the signals
	#	it can do so by simply looping through an array instead of writing out the name of each node. This way, if a sphere node
	#	or the sphere node's "var" has a different name than expected, there will not be a problem.
	#	That is, if the "connect()" funcion is looking for "Coll_Sphere_01" and it doesn't exist, it will have an error.
	#	But, instead, we will simply use an array and numbers, and the names will not matter. This is a basic but important
	#	concept of programming/scripting.
	#
	#If we want to show the collision spheres...
	if(Coll_Sphere_Switch):
		#Let's get a temp variable that will hold the reference to the player node.
		var Node_Player = get_tree().get_root().get_child(0).get_node("Player")
		#Instance collision spheres. The player's "move_and_slide()" function has a "max_slides" parameter, which is, by default, 4.
		var Coll_Sphere_Array = []
		#Let's get the "MaxSlides" variable from the player node.
		var Player_MaxSlides = Node_Player.get("MaxSlides")
		#Then let's make the array size the number of max slides that the player has.
		Coll_Sphere_Array.resize(Player_MaxSlides)
		
		#Load the sphere from the scene.
		#This will be the sphere scene that will visualize the player's collision slides for us.
		#	We will instance this scene so we can have multiple spheres. In other words we
		#	only need one scene, we will simply copy it around.
		var Coll_Sphere_Scene = load("res://scenes/DEBUG/Coll_Sphere.tscn")

		#Loop through the array and make each element a new sphere instance.
		for x in range(Player_MaxSlides):
			#Instance the sphere node from the reference scene.
			Coll_Sphere_Array[x] = Coll_Sphere_Scene.instance()

			#Set the variable "Array_Element_Number" that is inside the collision sphere's script to the
			#	array element reference number it has. This is needed for multiple spheres to have different positions.
			#	If this wasn't here, all spheres would have the same position. This way, each sphere is checked to see if
			#	it has the same collision slide number. I.e. "if(Array_Element_Number == slide_number): set sphere position"
			Coll_Sphere_Array[x].set("Array_Element_Number", x)

			#It's nessecary to call the "add_child()" function _after_ the main node adds all it's child nodes that are added to the scene in the Godot editor.
			#	So, what we will do is use "call_deferred()" and add the child this way.
			#	"call_deferred()" calls a function when the node that it's being called from isn't busy, when it is idle. It "defers", or postpones, the function
			#	being called until a later time, which in this case is when the node, in this case the "Main" node, is idle. That is, it isn't setting up children,
			#	instancing scenes, setting up video, compiling shaders, etc.
			get_tree().get_root().get_child(0).call_deferred("add_child", Coll_Sphere_Array[x])

			#Now let's connect the node to the signal in the player node.
			Node_Player.connect("Coll_Sphere_Show", Coll_Sphere_Array[x], "Coll_Sphere_Show")

		#Let's just set the initial global position of these spheres so we know, visually, that they are instancing correctly.
		#The temporary y-axis position value.
		var Temp_y = 0.0
		#Go through all the spheres...
		for x in range(Player_MaxSlides):
			#Add a little to the position of the sphere.
			Temp_y += 0.5
			#Then set the sphere's position.
			Coll_Sphere_Array[x].global_transform.origin = Vector3(0.0, Temp_y, 0.0)

################################################################
#					UNHANDLED INPUT							   #
################################################################
func _unhandled_input(event):
	#If the even is a keyboard key...
	if(event is InputEventKey):
		#If it's the "ui_cancel" action...
		if(Input.is_action_just_pressed("ui_cancel")):
			#Quit the whole program.
			get_tree().quit()
		
		#Else if the input is the "toggle fullscreen" key...
		#	INFO: "is_action_just_pressed() only gets the action one time, when it was initially pressed. This means it won't keep changing the window to
		#			fullscreen and back, over and over, if the action button/key is held down.
		elif(Input.is_action_just_pressed("Toggle_Fullscreen")):
			#If the viewport is currently fullscreen...
			if(OS.window_fullscreen):
				#Then make it windowed.
				OS.set_window_fullscreen(false)
			#Otherwise, if it isn't fullscreen...
			else:
				#Make it so.
				OS.set_window_fullscreen(true)

################################################################
#			REFERENCE CODE									   #
################################################################
#This is code you put in the kinematic character for when you want to visualize the slide collisions.
#	It makes a difference putting it before or after "move_and_slide()" as it changes the slides and their properties.
#
#if(get_slide_count()>0):
#		for slide in range(get_slide_count()):
#			emit_signal("Coll_Sphere_Show", slide, get_slide_collision(slide).position)
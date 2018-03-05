# This is a sphere to visualize the slide collisions in the player's character script.

# Extend the current nodes functionality.
extends ImmediateGeometry

# This number is set in the "Init_Script.gd" script attached to the main node in "Main.tscn".
#	This node is instanced several times, according to the number of maximum slides the player has,
#	which is set in the "MaxSlides" variable inside the player script.
#	Each time this node is instanced, this variable below is assigned its own number to corrisond
#	with the slide it's going to visualize.
var Array_Element_Number = null

################################################################
#	READY
################################################################
func _ready():
	# Create a line primitive that has a small sphere with a line going through it, top to bottom.
	begin(Mesh.PRIMITIVE_LINES, null)
	add_vertex(Vector3(0.0, -0.1, 0.0))
	add_vertex(Vector3(0.0, 0.1, 0.0))
	add_sphere(4, 8, 0.005, false)
	end()

################################################################
#	FUNCTIONS
################################################################
#		Coll_Sphere_Show(SlideNumber, Pos_Vec3)
# Sets the position of a collision sphere according to the slide number being calculated inside the kinematic character
#	script that is calling this function.
# "SlideNumber" is the slide number inside the kinematic character script that needs to be shown.
#	So if you have a for loop that says "for Slide in range(get_slide_count()):" inside the character script, you would use
#	"Slide" as this argument to visualize that specific slide.
# "Pos_Vec3" is the position of the slide. Use "get_slide_collision(Slide).position" to get the position of that specific slide.
func Coll_Sphere_Show(SlideNumber, Pos_Vec3):
	#If the current slide 
	if(SlideNumber == Array_Element_Number):
		self.global_transform.origin = Pos_Vec3

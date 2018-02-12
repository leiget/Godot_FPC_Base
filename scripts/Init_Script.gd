extends Spatial

func _ready():
	#Set the window title.
	OS.set_window_title("Godot 3.x FPC Base")
	
	#Set the mouse to be captured by the program.
	#Using "MOUSE_MODE_CAPTURED" doesn't work for some reason. I'll figure that out sometime later.
	Input.set_mouse_mode(2)
	
	#Enable unhandled input.
	#Unhandled input is any input not used by something else. For instance, if a menu is open, pressing "Space" won't
	#	make the player jump.
	set_process_unhandled_input(true)

func _unhandled_input(event):
	#If the even is a keyboard key...
	if(event is InputEventKey):
		#If it's the "ui_cancel" action...
		if(Input.is_action_pressed("ui_cancel")):
			#Quit the whole program.
			get_tree().quit()
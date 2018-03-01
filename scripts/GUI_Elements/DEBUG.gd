extends Control

func _ready():
	#Activate the unhandled input process.
	set_process_unhandled_input(true)

func _unhandled_input(event):
	#If the even is a keyboard key...
	if(event is InputEventKey):
		#If it's the "Player_ToggleDebug" action...
		if(Input.is_action_just_pressed("Player_ToggleDebug")):
			print("PRESSED")
			#If the debug info is visible...
			if(visible):
				print("VISIBLE")
				#Make it invisible.
				visible = false
			#Otherwise, if it isn't visible...
			else:
				print("NOT VISIBLE")
				#Make it so.
				visible = true
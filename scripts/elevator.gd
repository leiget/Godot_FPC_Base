# Extend the current nodes functionality.
extends KinematicBody

#The function that exectues whenever the player touches it.
func Touched_Function():
	#If the elevator animation isn't playing...
	if(not $AnimationPlayer.is_playing()):
		#Play it.
		$AnimationPlayer.play("Lift")
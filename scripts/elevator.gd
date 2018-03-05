extends KinematicBody

func Touched_Function():
	print("***")
	print(get_tree().get_root().get_child(0).get_node("Player").get_slide_count())
	if(not $AnimationPlayer.is_playing()):
		$AnimationPlayer.play("Lift")
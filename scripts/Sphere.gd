extends RigidBody

#The function that gets executed whenever the player presses "Use" on the object this is attached to.
#In this case, this function applies an impulse to wherever the player it pointing on the object.
func UseFunction():
	#Setup the position and scale that we will use to apply the impulse with.
	var Pos = Vector3(0,0,0)
	var Impulse = Vector3(0,0,0)
	#Setup the impulse multiplication factor according to the mass of the object.
	var Impulse_Mul = 5 / self.mass
	
	#Get the player node.
	var Player = get_tree().get_root().get_child(0).get_node("Player")
	#Get the player's camera node z transform vector.
	var Player_Cam_Vec3 = Player.get_node("Camera_Main").transform.basis.z
	
	#Setup the x, y, and z axis for says what direction the player camera is facing.
	var x = -Player.transform.basis.z.x
	var y = -Player_Cam_Vec3.y
	var z = -Player.transform.basis.z.z
	
	#Setup the player's camera vector according to which way it is looking.
	var Cam_Pointing_Dir = Vector3(x,y,z)
	
	#Set the position in global space, but relative to the object.
	#	This may be confusing, but what it is this way because the object may rotate.
	#	So the position of the impulse is in global space (not affected by the rotaton of the object),
	#		but is relative to the object.
	Pos = Player.Use_Ray_IntersectPos - self.get_translation()
	#The direction and magnitude to apply the impulse in.
	Impulse = Cam_Pointing_Dir * Impulse_Mul
	
	#Apply the impulse according to all the above.
	apply_impulse( Pos, Impulse )

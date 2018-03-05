# Position visualization.
#	For whenever you want to visualize where a 3D position

#Extend the current nodes functionality.
extends ImmediateGeometry

################################################################
#	READY
################################################################
func _ready():
	#Create axis lines.
	begin(Mesh.PRIMITIVE_LINES)
	add_vertex(Vector3(0.0, -0.5, 0.0))
	add_vertex(Vector3(0.0, 0.5, 0.0))
	add_vertex(Vector3(0.5, 0.0, 0.0))
	add_vertex(Vector3(-0.5, 0.0, 0.0))
	add_vertex(Vector3(0.0, 0.0, 0.5))
	add_vertex(Vector3(0.0, 0.0, -0.5))
	end()
	
	#Connect this node to the player node's axis rendering function.
	get_tree().get_root().get_child(0).get_node("Player").connect("Render_Pos", self, "Set_Position")

################################################################
#	FUNCTIONS
################################################################
#		Set_Position(Vec3_Pos)
# Sets the position of the axis node according to the 3D vector specified.
func Set_Position(Vec3_Pos):
	#Set position of attached node according to the 3D vector specified.
	self.transform.origin = Vec3_Pos

extends ImmediateGeometry

func _ready():
	begin(Mesh.PRIMITIVE_LINES)
	add_vertex(Vector3(0.0, -0.5, 0.0))
	add_vertex(Vector3(0.0, 0.5, 0.0))
	add_vertex(Vector3(0.5, 0.0, 0.0))
	add_vertex(Vector3(-0.5, 0.0, 0.0))
	add_vertex(Vector3(0.0, 0.0, 0.5))
	add_vertex(Vector3(0.0, 0.0, -0.5))
	end()
	
	#
	get_tree().get_root().get_child(0).get_node("Player").connect("RenderColl", self, "Set_Position")

func Set_Position(Vec3_Pos):
	self.transform.origin = Vec3_Pos

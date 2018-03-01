extends ImmediateGeometry

var Array_Element_Number = null

func _ready():
	#begin(Mesh.PRIMITIVE_TRIANGLES, null)
	begin(Mesh.PRIMITIVE_LINES, null)
	add_vertex(Vector3(0.0, -0.1, 0.0))
	add_vertex(Vector3(0.0, 0.1, 0.0))
	add_sphere(4, 8, 0.005, false)
	end()

func Coll_Sphere_Show(SlideNumber, Pos_Vec3):
	if(SlideNumber == Array_Element_Number):
		self.global_transform.origin = Pos_Vec3

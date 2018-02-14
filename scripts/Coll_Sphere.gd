extends ImmediateGeometry

var Array_Element_Number = null

func _ready():
	begin(Mesh.PRIMITIVE_TRIANGLES, null)
	add_sphere(4, 8, 0.04, false)
	end()

func Coll_Sphere_Show(Array_Element_Number_Arg, Pos_Vec3):
	if(Array_Element_Number_Arg == Array_Element_Number):
		self.global_transform.origin = Pos_Vec3

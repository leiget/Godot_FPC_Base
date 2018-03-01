extends TextureRect

func _ready():
	#Setup the initial FXAA rect size and the FXAA shader parameters according to screen size.
	ViewportSizeChanged()
	
	#Connect the appropriate function to the main viewport root node's "size_changed()" function, so when the viewport
	#	size changes the FXAA parameters will change appropriately.
	get_tree().get_root().connect("size_changed", self, "ViewportSizeChanged")

func ViewportSizeChanged():
	#Get the viewport size and pop it into a variable.
	var Viewport_Size = get_tree().get_root().get_visible_rect().size
	
	#Change rect size to current screen size.
	self.rect_size = Viewport_Size
	
	#Change appropriate shader params to screen size.
	self.material.set("shader_param/SCREENTEXTURE_Width", Viewport_Size.x)
	self.material.set("shader_param/SCREENTEXTURE_Height", Viewport_Size.y)
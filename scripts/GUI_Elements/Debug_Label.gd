extends Label

func _ready():
	#Initialize the crosshair position by simply calling the function that is used when the viewport size changes.
	ViewportSizeChanged()
	
	#Connect the appropriate function to the main viewport root node's "size_changed()" function, so when the viewport
	#	size is changed we can center and resize the crosshair.
	get_tree().get_root().connect("size_changed", self, "ViewportSizeChanged")

func ViewportSizeChanged():
	#Set the font's relative size.
	var Font_Size_Rel = 80.0/1080.0
	
	#Set the font rectangle and it's BG rectangle's relative size to the screen.
	var Font_RectSize_Rel = Vector2( Font_Size_Rel*6 , Font_Size_Rel*3 )
	
	#Get the viewport size and pop it into a variable.
	var Viewport_Size = get_tree().get_root().get_visible_rect().size
	
	#Set the font size according to it's relative size.
	self.get_font("font").set("size", Viewport_Size.y*Font_Size_Rel)
	
	#Then set both the label's rect size and that of it's first child (if it even exists) to what is stated above.
	self.rect_size = Vector2( Viewport_Size.x*Font_RectSize_Rel.x , Viewport_Size.y*Font_RectSize_Rel.y )
	if(self.get_child(0) != null):
		self.get_child(0).rect_size =  Vector2( Viewport_Size.x*Font_RectSize_Rel.x , Viewport_Size.y*Font_RectSize_Rel.y )
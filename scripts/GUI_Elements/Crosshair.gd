extends TextureRect

func _ready():
	#Initialize the crosshair position by simply calling the function that is used when the viewport size changes.
	ViewportSizeChanged()
	
	#Connect the appropriate function to the main viewport root node's "size_changed()" function, so when the viewport
	#	size is changed we can center and resize the crosshair.
	get_tree().get_root().connect("size_changed", self, "ViewportSizeChanged")

func ViewportSizeChanged():
	#In most cases I usually don't like to create variables in a function. I like to make the variables at the top of 
	#	the script so it isn't constantly created in and freed from memory. But in this case, since this function is
	#	rarely called, I have no problem having variables decalred in this function, as they will be freed after they
	#	get out of scope, or in other words, when the function is done they are removed from memory.
	
	#	My native monitor resolution is 1920x1080, and since I am developing this project at that resolution,
	#	everything in the GUI is releative to what it would be on my screen. But it doesn't matter what resolution you use,
	#	it will all be the same.
	#	Since in the "Project Settings" I have "Keep Height" set under the window aspect strech mode, I only care about the
	#	Y axis resolution of the viewport
	#So, in the variable below, the size of the crosshair on both the x and y axis will be "x" pixels relative to 1080 pixels.
	#	So if I used "64.0/1080.0", my ratio would be "0.0592592592592593"; the crosshair would be about 5.9% the height
	#	of the screen.
	#	Then I would multiply that number by the actual screen height to get my final number. Let's say the height is 768.
	#		That would be "768 * 0.0592592592592593", which equals "45.511"
	#	But there is a problem: in order to make the cross hair perfectly center, we need to round that number to the 
	#	nearest even number, which in this case would be 46. That way, 23 pixels will be on the right side of the screen
	#	and 23 pixels will be on the left.
	
	#Size ratio that the cross hair will have relative to the screen.
	var Y_Size_Ratio = 25.0/1080.0
	
	#Get the viewport size and pop it into a variable.
	var Viewport_Size = get_tree().get_root().get_visible_rect().size
	
	#Now make a variable and set it as the absolute size that we want the crosshair to be, casting it into an integer
	#	to get rid of the decimals.
	var Crosshair_Size = int(Y_Size_Ratio  *  Viewport_Size.x)
	
	#Check to see if the crosshair size variable is an even number.
	#	We do this with the "modulo" operator, which is the percentage sign: "%".
	#		What this does is divide the first number by the second number and then returns the remainder of the division.
	#		So if out crosshair size was "35" pixels, and then we divided that by 2, we would get "17.5". The remainder returned
	#		would be "1" in this case, but it's really "0.5", because that's what is left over when we divide something in half
	#		but don't have an even number. 
	#	But if the size of the crosshair was "34", our remainder would be 0, thus indicating it is an even number, as there
	#		is no decimals in the number when dividing an even number in half.
	#	FYI: If you are needing to modulo a floating point number, then use this function:
	#		"fmod(float a, float b)"
	#		It is this way because it helps to avoid mistakes, according to Juan Linietsky.
	#If the crosshair size is not an even number...
	if(Crosshair_Size % 2 != 0):
		#Add 1 pixel to it to make it an even number, so we can have a perfectly centered crosshair.
		Crosshair_Size += 1
	
	#Set the size of the crosshair rectangle.
	self.set_size(Vector2(Crosshair_Size, Crosshair_Size))
	#Then set the position the center of the crosshair to the center of the root viewport.
	self.set_position( Vector2( (Viewport_Size.x/2 - Crosshair_Size/2) , (Viewport_Size.y/2 - Crosshair_Size/2) ) )
	
	#Set the size of the red "Usable" circle.
	self.get_child(0).set_size(Vector2(Crosshair_Size, Crosshair_Size))
	#And set the position to line up with the crosshair.
	self.get_child(0).set_position( Vector2(0.0 , 0.0) )
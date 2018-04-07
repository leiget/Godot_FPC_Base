![Project Logo](/icon.png)

# Lei-Get's First-Person Camera Project for Godot 3.0.x

A FPC (first person camera) kinematic player base for reference and using as a base for your projects.

WIKI: [Click here to go to the project's wiki manual.](https://github.com/leiget/Godot_FPC_Base/wiki)

MANUAL: [Click here for the PDF manual.](https://github.com/leiget/Godot_FPC_Base/blob/master/documents/manual.pdf)

**NOTE: About "move_and_slide()" in newer versions of Godot 3.x**

Note that in Godot 3.0.2 the “**move_and_slide()**” function has 5 arguments, but in the latest GitHub version (as of March 07, 2018) it has 6, with the added argument being in the 3rd position and is “**bool infinite_inertia=true**”. If this option is true, what it means is that no other object can rotate the character. If false, it can if enough force is applied.”

“**bool infinite_inertia=true**” means that the character can’t be rotated, because the amount of inertia needed to do so is infinite.

From http://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html

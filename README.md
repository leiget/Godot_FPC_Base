![Project Logo](/icon.png)

# Lei-Get's First-Person Camera Project for Godot 3.0.x

A FPC (first person camera) kinematic player base for reference and using as a base for your projects.

MANUAL (WIP): [Click here for the PDF manual.](https://github.com/leiget/Godot_FPC_Base/blob/master/documents/manual.pdf)

**UPDATE on April 1, 2018:** I'm still working on the manual, as it's taking quite a while, but my ETA of the project's finsish should be in the next week or so. That doesn't mean the wiki will be finished, but the PDF manual will be finalized as will the project files.

My plan is to make a all-in-one player script and scene to allow others to import it into their project with as little effort as possible.
I also plan on making a step-by-step wiki/instruction manual on how it all works. The deadline I'm shooting for is the end of March 2018; so that would be 11:59 PM on March 31, 2018. I think I can do that. I've already got more than half done.

**NOTE: About "move_and_slide()" in newer versions of Godot 3.x**

I'm not sure if I should make this for the latest Godot build from github, or to just go with main releases. The reason I wonder over this is because about a week ago (~20 Feb, 2018) the Godot developers changed the "move_and_slide()" command to have an additional argument: an infinite_inertia bool.
I think the new argument has something to with having the character act more like a rigid body or not.
"A dynamic character controller uses a rigid body with infinite inertial tensor. Basically, it’s a rigid body that can’t rotate."

From http://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html

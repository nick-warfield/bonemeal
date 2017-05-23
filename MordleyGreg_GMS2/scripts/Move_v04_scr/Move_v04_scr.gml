//8 directional move, does a good job of keeping track of direction and speed 
//without relying on built in variables
//this script will change Dir only when moved,
//Dir can only be equal to 0, 45, 90, 135, 180, 225, 270, or 315

//0 - 360 refer to actual directions, so does 1000
//but its large enough that I won't set to it, so I'm using it as I would a null value
var xdir = 1000;
var ydir = 1000;

//set my x direction based on right and left inputs
if (Input[RIGHT])
{
    xdir = 0;
}
else if (Input[LEFT])
{
    xdir = 180;
}

//set my y direction based on up and down inputs
if (Input[UP])
{
    ydir = 90;
}
else if (Input[DOWN])
{
    ydir = 270;
    if (xdir == 0) { xdir = 360; }      //in order for the direction to average corectly when moving down and right, I need to set the x direction to 360 instead of 0
}

//preserve the current direction and don't move if none of the inputs changed the local variables
if (xdir == 1000 && ydir == 1000) { motion_set(Dir, 0); }

//if the x direction remained unchanged, then y direction changed. Set the direction to the y direction and then move that way
else if (xdir == 1000) { Dir = ydir; motion_set(Dir, spd); }

//same as above, but swap x and y
else if (ydir == 1000) { Dir = xdir; motion_set(Dir, spd); }

//both directions have been changed, average them out and move in that direction
else { Dir = (xdir + ydir) / 2; motion_set (Dir, spd); }

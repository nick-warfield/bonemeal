
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

if (xdir == 1000 && ydir == 1000) { spd = 0; }

//if the x direction remained unchanged, then y direction changed. Set the direction to the y direction and then move that way
else if (xdir == 1000) { Dir = ydir; spd = 3; }

//same as above, but swap x and y
else if (ydir == 1000) { Dir = xdir; spd = 3; }

//both directions have been changed, average them out and move in that direction
else { Dir = (xdir + ydir) / 2; spd = 3; }

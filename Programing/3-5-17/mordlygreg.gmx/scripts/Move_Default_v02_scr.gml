//player movement and controls

var xDir = 0;
var yDir = 0;

//movemnt jazz
//gives priority to left and down movement, needs to change to equal priority
if(Input[UP] == true)
{
    yDir = -1;
    facing = UP;
    
} 

if(Input[DOWN] == true)
{
    yDir = 1;
    facing = DOWN;
    
}

if(Input[RIGHT] == true)
{
    xDir = 1;
    facing = RIGHT;
   
}
if(Input[LEFT] == true)
{
    xDir = -1;
    facing = LEFT;
    
}

facing *= 90;
direction = facing;
//show_debug_message(facing);

xSpeed = xDir * spd;
ySpeed = yDir * spd;

hspeed = xSpeed;
vspeed = ySpeed;

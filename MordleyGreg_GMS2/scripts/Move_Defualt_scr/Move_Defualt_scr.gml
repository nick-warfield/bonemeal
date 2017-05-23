//player movement and controls

var xDir = 0;
var yDir = 0;

//movemnt jazz
//gives priority to left and down movement, needs to change to equal priority
if(Input[UP] == true)
{
    yDir = -1;
    facing = UP;
    
    id.sprite_index = Mordley_Back_spr;
    image_xscale = 1;
}
if(Input[DOWN] == true)
{
    yDir = 1;
    facing = DOWN;
    
    id.sprite_index = Mordley_Front_spr;
    image_xscale = 1;
}

if(Input[RIGHT] == true)
{
    xDir = 1;
    facing = RIGHT;
    
    id.sprite_index = Mordley_Side_spr;
    image_xscale = 1;
}
if(Input[LEFT] == true)
{
    xDir = -1;
    facing = LEFT;
    
    id.sprite_index = Mordley_Side_spr;
    image_xscale = -1;
}

facing *= 90;
direction = facing;
//show_debug_message(facing);

xSpeed = xDir * spd;
ySpeed = yDir * spd;

hspeed = xSpeed;
vspeed = ySpeed;

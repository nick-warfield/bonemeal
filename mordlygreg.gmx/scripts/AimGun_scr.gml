//aim gun code
//show_debug_message("aiming");

if(Input[DOWN] == false && Input[UP] == false && Input[RIGHT] == false && Input[LEFT] == false)
{
    direction = facing;
}
else
{
    if(Input[UP] == true)
    {
        facing = UP;
    }
    if(Input[DOWN] == true)
    {
        facing = DOWN;
    }
    if(Input[RIGHT] == true)
    {
        facing = RIGHT;
    }
    if(Input[LEFT] == true)
    {
        facing = LEFT;
    }
    
    facing *= 90;
    direction = facing;
}


if (direction >= 45 && direction < 135) { direction = 90; }
if (direction >= 135 && direction < 225) { direction = 180; }
if (direction >= 225 && direction < 315) { direction = 270; }
if (direction >= 315 && direction < 45) { direction = 0; }

hspeed = 0;
vspeed = 0;

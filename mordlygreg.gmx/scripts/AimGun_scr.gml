//aim gun code
show_debug_message("aiming");

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

//facing = (facing1 + facing2 + facing3 + facing4) / 4;

//facing = facing * 90;
show_debug_message(facing);

hspeed = 0;
vspeed = 0;

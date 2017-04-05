
if (place_meeting(x + hspeed, y + vspeed, Character_obj) 
    || place_meeting(x + hspeed, y + vspeed, Wall_obj))
{
    f = instance_place(x, y, Player02_obj);
    with (f)
    { script_execute(state[s_DAMAGED], 1, 0); }
    

    if(Input[RIGHT])
    {
        Input[RIGHT] = false;
        Input[LEFT] = true;
    }
    else
    {
        Input[LEFT] = false;
        Input[RIGHT] = true;
    }
}

/*
    with(Player02_obj)
    {
        script_execute(state[s_DAMAGED], 1, 0);
    }

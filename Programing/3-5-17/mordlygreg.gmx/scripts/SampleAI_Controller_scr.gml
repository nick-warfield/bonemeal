
if (place_meeting(x + hspeed, y + vspeed, Character_obj) 
    || place_meeting(x + hspeed, y + vspeed, Wall_obj))
{
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

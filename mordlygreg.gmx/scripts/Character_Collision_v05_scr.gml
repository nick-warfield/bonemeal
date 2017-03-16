//collisions for Character objects

//Character collisions
//detect a collision with any character that is not this character
if (place_meeting(x + spd, y, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x + spd, y, Character_obj);

    if (place_meeting(otherChar.x + spd, otherChar.y, Wall_obj) == true)
    {
        spd = 0;
        otherChar.spd = 0;
    }
    else
    {
        show_debug_message(otherChar);
        spd = (spd + otherChar.spd) / 2;
        otherChar.spd = spd;
    }
}

if (place_meeting(x, y + spd, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x, y + spd, Character_obj);

    if (place_meeting(otherChar.x, otherChar.y + spd, Wall_obj) == true)
    {
        spd = 0;
        otherChar.spd = 0;
    }
    else
    {
        spd = (spd + otherChar.spd) / 2;
        otherChar.spd = spd;
    }
}


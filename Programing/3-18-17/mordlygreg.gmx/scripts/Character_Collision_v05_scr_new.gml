//collisions for Character objects

//Character collisions
//detect a collision with any character that is not this character
if (place_meeting(x + hspeed, y, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x + hspeed, y, Character_obj);

    if (place_meeting(otherChar.x + hspeed, otherChar.y, Wall_obj) == true)
    {
        hspeed = 0;
        otherChar.hspeed = 0;
    }
    else
    {
        hspeed = (hspeed + otherChar.hspeed) / 2;
        otherChar.hspeed = hspeed;
    }
}

if (place_meeting(x, y + vspeed, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x, y + vspeed, Character_obj);

    if (place_meeting(otherChar.x, otherChar.y + vspeed, Wall_obj) == true)
    {
        vspeed = 0;
        otherChar.vspeed = 0;
    }
    else
    {
        vspeed = (vspeed + otherChar.vspeed) / 2;
        otherChar.vspeed = vspeed;
    }
}


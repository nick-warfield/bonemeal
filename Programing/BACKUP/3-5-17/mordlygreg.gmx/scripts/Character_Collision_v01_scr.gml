//collisions for character objects


//character collisions
if (place_meeting(x + hspeed, y, Character_obj) == true)
{
    while (place_meeting(x + sign(hspeed), y, Character_obj) == false)
    {
        x += sign(hspeed);
    }
    Character_obj.hspeed = (hspeed + Character_obj.hspeed) / 2;
}

if (place_meeting(x, y + vspeed, Character_obj) == true)
{
    while (place_meeting(x, y + sign(vspeed), Character_obj) == false)
    {
        y += sign(vspeed);
    }
    Character_obj.vspeed = (vspeed + Character_obj.vspeed) / 2;
}
//feels better than wall collision,
//but makes a lot of bugs when also colliding with walls or other moving characters



//wall collision

//detect wall in horizontal axis
if (place_meeting(x + hspeed, y, Wall_obj) == true)
{
    //move as close to the wall as possible
    while (place_meeting(x + sign(hspeed), y, Wall_obj) == false)
    {
        x += sign(hspeed);
    }
    //stop horizontal movement
    hspeed = 0;
}
//detect wall in vertical axis
if (place_meeting(x, y + vspeed, Wall_obj) == true)
{
    //move as close to the wall as possible
    while (place_meeting(x, y + sign(vspeed), Wall_obj) == false)
    {
        y += sign(vspeed);
    }
    //stop vertical movement
    vspeed = 0;
}
//this collision code works great for things that look they shouldn't move at all
//but it makes things that ought to move immovable


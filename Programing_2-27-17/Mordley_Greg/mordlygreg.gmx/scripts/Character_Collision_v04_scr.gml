//collisions for Character objects

//this feels pretty good, nevermind, it's less consistent then v02
//since enemies are also character objects they run both collisions when hit

//CHARACTER COLLISIONS
if (place_meeting(x + hspeed, y, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x + hspeed, y, Character_obj);

    hspeed = (hspeed + otherChar.hspeed) / 2;
    otherChar.hspeed = hspeed;
}
if (place_meeting(x, y + vspeed, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x, y + vspeed, Character_obj);

    vspeed = (vspeed + otherChar.vspeed) / 2;
    otherChar.vspeed = vspeed;
}


//make it so that the player has priority over other the things it collides with
if (place_meeting(x + hspeed, y, Enemy_obj) == true)
{
    enemyHit = instance_place(x + hspeed, y, Enemy_obj);
    
    while (place_meeting(x + sign(hspeed), y, enemyHit) == false)
    {
        x += sign(hspeed);
    }
    enemyHit.hspeed = 0;
    //hspeed = enemyHit.hspeed;
}
if (place_meeting(x, y + vspeed, Enemy_obj) == true)
{
    enemyHit = instance_place(x, y + vspeed, Enemy_obj);

    //move as close to the wall as possible
    while (place_meeting(x, y + sign(vspeed), enemyHit) == false)
    {
        y += sign(vspeed);
    }
    //stop vertical movement
    enemyHit.vspeed = 0;
    //vspeed = enemyHit.vspeed;
}



//WALL COLLISIONS
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
    
    otherObj = instance_place(x, y, all);
    if (otherObj == Character_obj) { otherObj.hspeed = 0; }
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

/*
//Character collisions
//detect a collision with any character that is not this character
if (place_meeting(x + hspeed, y, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x + hspeed, y, Character_obj);

    hspeed = (hspeed + otherChar.hspeed) / 2;
    otherChar.hspeed = hspeed;
}


if (place_meeting(x, y + vspeed, Character_obj) == true && Character_obj != id)
{
    otherChar = instance_place(x, y + vspeed, Character_obj);

    vspeed = (vspeed + otherChar.vspeed) / 2;
    otherChar.vspeed = vspeed;
}


//wall collision
//detect wall in horizontal axis
if (place_meeting(x + hspeed, y, Wall_obj) || place_meeting(x, y + vspeed, Wall_obj))
{
    //stop horizontal movement
    hspeed = 0;

    //stop vertical movement
    vspeed = 0;
}


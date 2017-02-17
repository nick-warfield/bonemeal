//collisions for character objects

//wall collision
if (place_meeting(x + hspeed, y, Wall_obj) == true)
{
    while (place_meeting(x + sign(hspeed), y, Wall_obj) == false)
    {
        x += sign(hspeed);
    }
    hspeed = 0;
}
if (place_meeting(x, y + vspeed, Wall_obj) == true)
{
    while (place_meeting(x, y + sign(vspeed), Wall_obj) == false)
    {
        y += sign(vspeed);
    }
    vspeed = 0;
}
//this collision code works great for things that look they shouldn't move at all
//but it makes things that ought to move immovable


//character collisions
if (place_meeting(x + hspeed, y, Character_obj) == true)
{
    while (place_meeting(x + sign(hspeed), y, Character_obj) == false)
    {
        x += sign(hspeed);
    }
    hspeed = 0;
}
if (place_meeting(x, y + vspeed, Character_obj) == true)
{
    while (place_meeting(x, y + sign(vspeed), Character_obj) == false)
    {
        y += sign(vspeed);
    }
    vspeed = 0;
}

/*
//projectile collision should get moved onto the projectiles, doing it this way will destroy all instances
//of a projectile upon collision. It will also make it easier to check for specific objects to collide with
//and do different things depending on the object
//getin hit by a projectile
if (place_meeting(x, y, bullet_obj) == true)
{
    //destroy thing that got hit
    instance_destroy();
    
    //destroy thing doing the hitting
    with(instance_place(x, y, bullet_obj))
    {
        instance_destroy();
    }
}


/*
//collide with other characters
if (place_meeting(x, y, Character_obj)) 
{
    hspeed = 0;
    vspeed = 0;
    
    x = lastx;
    y = lasty;
}

//collide with walls
if (place_meeting(x, y, Wall_obj)) 
{
    hspeed = 0;
    vspeed = 0;
    
    x = lastx;
    y = lasty;
}


//last position
lastx = x;
lasty = y;

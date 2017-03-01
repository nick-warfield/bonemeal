//collisions for projectiles

//only run collisions on objects that did not spawn the projectile
if (place_meeting(x, y, spawner) == false)
{

    //if character hit
    if (place_meeting(x, y, Character_obj) == true)
    {
        with(instance_place(x, y, Character_obj))
        {
            instance_destroy();
        }
        instance_destroy();
    }
    
    //if solid wall hit
    if (place_meeting(x, y, Wall_obj) == true)
    {
        instance_destroy();
    }

}

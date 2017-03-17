//collisions for projectiles

//only run collisions on objects that did not spawn the projectile
if (place_meeting(x, y, spawner) == false)
{
    //if character hit
    if (place_meeting(x, y, Character_obj) == true)
    {
        var scrub = instance_place(x, y, Character_obj);
        scrub.hurter = id;
        
        with(scrub)
        {
            script_execute(TookDamage_v02_scr, 3, 10, 75);
        }
        if (scrub.timeStamp[0] == current_time + 1000) {instance_destroy();}
    }
    
    //if solid wall hit
    if (place_meeting(x, y, Wall_obj) == true)
    {
        instance_destroy();
    }

}

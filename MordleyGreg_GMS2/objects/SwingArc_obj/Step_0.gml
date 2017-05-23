//delete object after a certain number of miliseconds

if(current_time >= timeStamp_local)
{ instance_destroy(); }

//collisions for projectiles

var thing = collision_circle(x, y, 32, Character_obj, false, true);

//only run collisions on objects that did not spawn the projectile
if (thing != spawner)
{
    with (thing) { script_execute(TookDamage_scr, 2, 50, id); }
}
/*
if (place_meeting(x, y, spawner) == false)
{
    //if character hit
    if (place_meeting(x, y, Character_obj) == true)
    {
        with(instance_place(x, y, Character_obj))
        {
            script_execute(TookDamage_scr, 2, 50, id);
        }
    }

}

/* */
/*  */

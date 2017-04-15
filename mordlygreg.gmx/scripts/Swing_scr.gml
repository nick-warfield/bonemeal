if (facing == RIGHT)
{
    var thing = collision_circle(x + 32, y, 48, all, false, true);
    Dir = 0;
}
else if (facing == LEFT)
{
    var thing = collision_circle(x - 32, y, 48, all, false, true);
    Dir = 180;
}
else if (facing == UP)
{
    var thing = collision_circle(x, y - 48, 48, all, false, true);
    Dir = 90;
}
else if (facing == DOWN)
{
    var thing = collision_circle(x, y + 48, 48, all, false, true);
    Dir = 270;
}

if (thing != id && instance_exists(thing))
{
    if (object_get_parent(thing.object_index) == Character_obj)
    { show_debug_message("CHAR");
        if (thing.timeStamp[0] == 0)
        {
            //stamina += 12;
            
            var t = id;
            with (thing)
            {
                script_execute(SetDamageVars_scr(t, 10, 100, 1, NULL));
                ds_stack_push(StateStack, s_DAMAGED);
            }
        }
    }
    else if (object_get_parent(thing.object_index) == Small_obj)
    { show_debug_message("CRATE");
        with (thing) { instance_destroy(); }
    }
}


if (facing == RIGHT)
{
    var thing = collision_ellipse(x + 64, y + 64, x, y - 64, Character_obj, false, true);
    Dir = 0;
}
else if (facing == LEFT)
{
    var thing = collision_ellipse(x + 64, y - 64, x, y - 64, Character_obj, false, true);
    Dir = 180;
}
else if (facing == UP)
{
    var thing = collision_ellipse(x + 64, y - 64, x - 64, y, Character_obj, false, true);
    Dir = 90;
}
else if (facing == DOWN)
{
    var thing = collision_ellipse(x + 64, y - 64, x - 64, y, Character_obj, false, true);
    Dir = 270;
}

if (thing != id && instance_exists(thing))
{
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

if (facing == RIGHT)
{
    var thing = collision_ellipse(x + 64, y + 64, x, y - 64, Small_obj, false, true);
    Dir = 0;
}
else if (facing == LEFT)
{
    var thing = collision_ellipse(x + 64, y - 64, x, y - 64, Small_obj, false, true);
    Dir = 180;
}
else if (facing == UP)
{
    var thing = collision_ellipse(x + 64, y - 64, x - 64, y, Small_obj, false, true);
    Dir = 90;
}
else if (facing == DOWN)
{
    var thing = collision_ellipse(x + 64, y - 64, x - 64, y, Small_obj, false, true);
    Dir = 270;
}

if (instance_exists(thing) && object_get_parent(thing.object_index) != Character_obj)
{
    with (thing) { instance_destroy(); }
}


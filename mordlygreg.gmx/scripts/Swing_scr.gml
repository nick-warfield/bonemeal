if (facing == RIGHT)
{
    var thing = collision_circle(x + 32, y, 48, Character_obj, false, true);
    Dir = 0;
}
else if (facing == LEFT)
{
    var thing = collision_circle(x - 32, y, 48, Character_obj, false, true);
    Dir = 180;
}
else if (facing == UP)
{
    var thing = collision_circle(x, y - 48, 48, Character_obj, false, true);
    Dir = 90;
}
else if (facing == DOWN)
{
    var thing = collision_circle(x, y + 48, 48, Character_obj, false, true);
    Dir = 270;
}

if (thing != id && instance_exists(thing))
{
    if (thing.timeStamp[0] == 0)
    {
        stamina += 12;
        
        var t = id;
        with (thing)
        {
            script_execute(SetDamageVars_scr(t, 10, 100, 1, NULL));
            ds_stack_push(StateStack, s_DAMAGED);
        }
    }
}


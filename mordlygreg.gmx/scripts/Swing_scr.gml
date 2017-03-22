if (facing == RIGHT)
{
    var thing = collision_circle(x + 32, y, 32, Character_obj, false, true);
}
else if (facing == LEFT)
{
    var thing = collision_circle(x - 32, y, 32, Character_obj, false, true);
}
else if (facing == UP)
{
    var thing = collision_circle(x, y - 48, 32, Character_obj, false, true);
}
else if (facing == DOWN)
{
    var thing = collision_circle(x, y + 48, 32, Character_obj, false, true);
}

if (thing != id && instance_exists(thing))
{
    if (thing.State != s_DAMAGED) { stamina += 15; }
    with (thing) { script_execute(TookDamage_v02_scr, 1, 10, 50); }
}


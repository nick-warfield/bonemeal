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

if (thing != id)
{
    //thing.hurter = id;
    with (thing) { script_execute(TookDamage_v02_scr, 1, 10, 50); }
    //audio_play_sound(Hit02_Umbrella_snd, 50, false);
}
//if (!instance_exists(thing)) { audio_play_sound(Swing_Umbrella_snd, 50, false); }

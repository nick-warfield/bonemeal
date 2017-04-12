if (facing == RIGHT)
{
    var thing = collision_circle(x + 32, y, 32, Projectile_obj, false, true);
}
else if (facing == LEFT)
{
    var thing = collision_circle(x - 32, y, 32, Projectile_obj, false, true);
}
else if (facing == UP)
{
    var thing = collision_circle(x, y - 48, 32, Projectile_obj, false, true);
}
else if (facing == DOWN)
{
    var thing = collision_circle(x, y + 48, 32, Projectile_obj, false, true);
}


if (instance_exists(thing))
{
    if (thing.spawner != id)
    { show_debug_message("Parry");
        thing.spawner = id;
        thing.direction = point_direction(x, y, thing.x, thing.y);
        thing.image_angle = thing.direction;
        thing.x = (x + thing.x) / 2;
        thing.y = (y + thing.y) / 2;
        //stamina += 21;
    }
}

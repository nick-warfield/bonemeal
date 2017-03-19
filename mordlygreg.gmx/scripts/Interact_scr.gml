//interact with stuff
if (facing == RIGHT)
{
    var thing = collision_rectangle(x, y, x + 24, y, Sign_obj, false, false);
}
else if (facing == LEFT)
{
    var thing = collision_rectangle(x - 24, y, x, y, Sign_obj, false, false);
}
else if (facing == UP)
{
    var thing = collision_rectangle(x, y - 40, x, y, Sign_obj, false, false);
}
else if (facing == DOWN)
{
    var thing = collision_rectangle(x, y, x, y + 40, Sign_obj, false, false);
}

if (thing != noone)
{
    
}

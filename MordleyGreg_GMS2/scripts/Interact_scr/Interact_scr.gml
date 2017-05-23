//interact with stuff

Input[INTERACT] = false;

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


var cam = instance_find(Camera_obj, 1);
if (thing != noone)
{
    for (var i = 0; i < array_length_1d(thing.message); i++)
    {
        cam.message[i] = thing.message[i];
    }
    
    cam.messageCurrent = thing.messageCurrent;
    cam.portrait = thing.portrait;
    cam.done = thing.done;
}
else { cam.done = true; }


var thing = collision_circle(x, y , 64, Character_obj, false, true);

if (thing != id && instance_exists(thing))
{
    if (thing.timeStamp[0] == 0)
    {
        //stamina += 12;
        
        var t = id;
        with (thing)
        {
            script_execute(SetDamageVars_scr(t, 10, 100, 2, NULL));
            ds_stack_push(StateStack, s_DAMAGED);
        }
    }
}


var thing = collision_circle(x, y , 64, Small_obj, false, true);

if (instance_exists(thing) && object_get_parent(thing.object_index) != Character_obj)
{
    with (thing) { instance_destroy(); }
}


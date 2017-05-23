if (global.paused) {exit;}

if (current_time >= timeStamp) {instance_destroy();}


var oops = instance_place(x, y, Character_obj);

//use a switch statement to check for things I want to fall in pits and ignore other things
if (instance_exists(oops) && oops.object_index != Bat_obj && oops.object_index != Boss_obj)
{
    oops.mask_index = Mask_Feet_Mordley_spr;
    if(place_meeting(x, y, oops) && ds_stack_top(oops.StateStack) != s_DODGE && oops.timeStamp[0] == 0)
    {
        oops.damage = 2;
        oops.hurter = id;
        ds_stack_push(oops.StateStack, s_DAMAGED);
        //use some vector math to create a dragging sort of effect that slowly pulls object into the center of the pit
        //oops.spd -= 1;
    
        //if((oops.x < x+16 && oops.x > x-16) && (oops.y+24 < y+16 && oops.y+24 > y-16) && ds_stack_top(oops.StateStack))
        //{
            //oops.healthPoints -= 2;
            //ds_stack_push(oops.StateStack, s_DAMAGED);
        //}
    }
    oops.mask_index = Mask_Wall_Mordley_spr;
}


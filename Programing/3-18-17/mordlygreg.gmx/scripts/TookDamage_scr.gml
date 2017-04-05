//run this if you got hit scrub
damage = argument0;
knbck = argument1;
hurter = argument2;

//only run this code if more than a second has passed since the last hit
if (current_time > timeStamp[0])
{
    healthPoints = healthPoints - argument0;
    
    thatWay = point_direction(hurter.x, hurter.y, x, y);
    //motion_add(thatWay, knbck);
    
    //set a 1 second invulnerabiliy period
    timeStamp[0] = current_time + 1000;
    
    show_debug_message(healthPoints);
}

//motion_add(-facing, knockback);

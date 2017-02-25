//run this if you got hit scrub
damage = argument0;
//knockback = argument1;
//show_debug_message(argument0);

//only run this code if more than a second has passed since the last hit
if (current_time > timeStamp[0])
{
    healthPoints = healthPoints - argument0;
    
    //set a 1 second invulnerabiliy period
    timeStamp[0] = current_time + 1000;
}

//motion_add(-facing, knockback);
show_debug_message(healthPoints);

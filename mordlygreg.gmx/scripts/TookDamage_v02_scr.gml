dmg = argument0;
force = argument1;
kbck = argument2;

//only run this code if more than a second has passed since the last hit
if (current_time > timeStamp[0] && State != s_DODGE)
{
    healthPoints = healthPoints - dmg;
    show_debug_message(healthPoints);
    
    //set a 1 second invulnerabiliy period
    timeStamp[0] = current_time + 1000;
    timeStamp[1] = current_time + kbck;
    
    State = s_DAMAGED;
    Dir = point_direction(hurter.x, hurter.y, x, y);
    spd = force;
    
    script_execute(Var_Collision_scr);
}

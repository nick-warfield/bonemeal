//execute on entering damage state
/*
//needs update, have to take out the 2 if statements so that each object
//can have their own inculnerablity checks and change behaviors if hurt
if (timeStamp[0] == 0)
{
    ds_stack_pop(StateStack);   //pop off damage state so that the last state can be read
    if (ds_stack_top(StateStack) != s_DODGE)
    {*/
        //goto stun state
        ds_stack_push(StateStack, s_STUNED);
        
        //set timers
        timeStamp[0] = current_time + invulTime;        //how long invulnerability lasts
        timeStamp[1] = current_time + knockbackTime;    //how long to spend in stun state
        
        //damage and knockback
        healthPoints -= damage;
        Dir = point_direction(hurter.x, hurter.y, x, y);
        spd = knockbackForce;
        script_execute(Var_Collision_scr);  //update variables for collision checking
        
        //polish effects
        audio_play_sound(hurtNoise, 50, false);


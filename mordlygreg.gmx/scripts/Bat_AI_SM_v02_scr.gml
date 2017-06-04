if (global.paused) {exit;}

if (!instance_exists(target))
{
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, -1);
}


switch(ds_stack_top(StateStack))
{
  case -1:      //if target not found
    if (instance_exists(target)) { ds_stack_push(StateStack, s_IDLE); }
    break;
    

  case s_DAMAGED:       //when bat takes damage
    ds_stack_pop(StateStack);
    
    if (timeStamp[0] == 0)
    { script_execute(TookDamage_v03_scr); saveData_set_value(key, healthPoints); }
    
    break;
  
    /*
    move into stun state
    if(current_time >= timeStamp[0])
    {
        if (healthPoints <= 0) { instance_destroy(); }
        timeStamp[2] = current_time + random_range(1000, 2000);
        sprite_index = Walk_Front_Bat_spr;
        State = s_MOVE;
    }
    if (timeStamp[1] >= current_time)
    { sprite_index = Hurt_Front_Bat_spr; }
    else {spd = 0;}
    
    break;
    */
    
    
  case s_STUNED:
    if (current_time >= timeStamp[1])
    {
        spd = 0;
        if (healthPoints <= 0) {instance_destroy();}
    }
    
    if (current_time >= timeStamp[0])
    {
        ds_stack_pop(StateStack);           //pop stun
        ds_stack_pop(StateStack);           //pop previous state
        ds_stack_push(StateStack, s_MOVE);  //push move state
    }
    
    break;
    
    
  case s_IDLE:      //when the bat is doing nothing, waiting for player
    spd = 0;
  
    if (distance_to_object(target) < 5 * 32)
    {
        timeStamp[2] = current_time + random_range(1000, 2000);
        ds_stack_push(StateStack, s_MOVE);
    }
    else if (timeStamp[2] != 0 && distance_to_object(target) > 15 * 32)
    { ds_stack_push(StateStack, s_ATTACK2); }
    
    break;
    
    
  case s_MOVE:      //when target gets too close and bat becomes agitated
    spd = 2;
  
    if (current_time >= timeStamp[3])
    {
        Dir = random(360);
        timeStamp[3] = current_time + random_range(100, 300);
    }
    
    if (current_time >= timeStamp[2])
    {
        if (distance_to_object(target) > 8 * 32) { State = s_IDLE; }
        else 
        {
            Dir = point_direction(x, y, target.x, target.y);
            spd = 3.5;
            timeStamp[4] = current_time + 1000;
            ds_stack_push(StateStack, s_ATTACK1);
        }
    }
    
    break;
    
    
  case s_ATTACK1:   //when the bat decides to charge
    if (current_time >= timeStamp[4])
    {
        ds_stack_clear(StateStack);
        ds_stack_push(StateStack, s_IDLE);
    }
    break;
    
    
  case s_ATTACK2:   //when the player gets too far out of range and has agitated the bat once
    Dir = point_direction(x, y, target.x, target.y);
    spd = 2;
    if (distance_to_object(target) <= 7 * 32)
    { ds_stack_pop(StateStack); }
    break;
    
    
  case s_ATTACK4:   //if the target got hit, run away for a bit 
    if (current_time >= timeStamp[5])
    {
        ds_stack_clear(StateStack);
        ds_stack_push(StateStack, s_IDLE, s_ATTACK2);
    }
    break;
    
    
  default:
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, s_IDLE);
    //show_debug_message("Defaulted");
    break;
}


//Reset invulnerability timer once it has finished counting down
if (current_time >= timeStamp[0]) 
{
    timeStamp[0] = 0;
    sprite_index = Walk_Front_Bat_spr;
}
//hurt animation
else
{
    sprite_index = Hurt_Front_Bat_spr;
}



if (place_meeting(x, y, target))    //damage the target
{
    var t = id;
    with (target)
    {
        script_execute(SetDamageVars_scr(t, 7, 100, 1, NULL));
        ds_stack_push(StateStack, s_DAMAGED);
    }
    
    if (target.timeStamp[0] == 0)
    {
        timeStamp[5] = current_time + random_range(2000, 3000);
        Dir = random(360);
        spd = 4;
        ds_stack_push(StateStack, s_ATTACK4);
    }
}


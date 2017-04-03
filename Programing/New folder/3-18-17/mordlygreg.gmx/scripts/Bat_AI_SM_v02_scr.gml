
switch(State)
{
  case s_DAMAGED:       //when bat takes damage
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
    
    
  case s_IDLE:      //when the bat is doing nothing, waiting for player
    spd = 0;
  
    if (distance_to_object(target) < 5 * 32)
    {
        timeStamp[2] = current_time + random_range(1000, 2000);
        State = s_MOVE;
    }
    else if (timeStamp[2] != 0 && distance_to_object(target) > 15 * 32)
    { State = s_ATTACK2; }
    
    break;
    
    
  case s_MOVE:      //when target gets too close and bat becomes agitated
    spd = 3;
  
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
            spd = 6;
            timeStamp[4] = current_time + 1000;
            State = s_ATTACK1;
        }
    }
    
    break;
    
    
  case s_ATTACK1:   //when the bat decides to charge
    if (current_time >= timeStamp[4]) { State = s_IDLE; }
    break;
    
    
  case s_ATTACK2:   //when the player gets too far out of range and has agitated the bat once
    Dir = point_direction(x, y, target.x, target.y);
    spd = 2;
    if (distance_to_object(target) <= 7 * 32) { State = s_IDLE; }
    break;
  
    
  case s_ATTACK3:   //if the target cannot be found go to this state
    if (instance_exists(target)) { State = s_IDLE; }
    break;
    
    
  case s_ATTACK4:   //if the target got hit, run away for a bit 
    if (current_time >= timeStamp[5]) { State = s_ATTACK2; }
    break;
    
    
  default:
    State = s_IDLE;
    //show_debug_message("Defaulted");
    break;
}


if (!instance_exists(target)) { State = s_ATTACK3; }


if (place_meeting(x, y, target))    //damage the target
{
    target.hurter = id;
    with (target)
    { script_execute(TookDamage_v02_scr(1, 7, 100)); }
    
    if (target.timeStamp[0] == current_time + 1000)
    {
        //show_debug_message("Drive By Motherfuckas");
        timeStamp[5] = current_time + random_range(2000, 3000);
        Dir = random(360);
        spd = 4;
        State = s_ATTACK4;
    }
}


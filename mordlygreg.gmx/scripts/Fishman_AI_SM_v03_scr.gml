switch(ds_stack_top(StateStack))
{
  case -1:      //if target not found
    if (instance_exists(target)) { ds_stack_push(StateStack, s_IDLE); }
    break;
    
    
  case s_DAMAGED:
    ds_stack_pop(StateStack)
    
    if (timeStamp[0] == 0)
    { script_execute(TookDamage_v03_scr); }
    
    break;
    
    
  case s_STUNED:
    if (current_time >= timeStamp[1])
    {
        spd = 0;
        if (healthPoints <= 0) {instance_destroy();}
    }
    
    if (current_time >= timeStamp[0])
    { ds_stack_pop(StateStack); }
    
    break;
    
    
  case s_IDLE:
    if (current_time >= timeStamp[3])
    {
        timeStamp[2] = current_time + random_range(3000, 5000);
        timeStamp[3] = timeStamp[2] + random_range(250, 1500);
    }
    else if (current_time >= timeStamp[2])
    {
        spd = 1;
        script_execute(Move_Fishman_Ani_scr);
    }
    else { spd = 0; Dir = random(360); sprite_index = Fishman_Idle_spr; image_xscale = 1; }

    if (distance_to_object(target) <= 7 * 32 && current_time >= timeStamp[4])
    {
        timeStamp[4] = current_time + 1000;
        ds_stack_push(StateStack, s_ATTACK1);
    }
    else if (distance_to_object(target) <= 3 * 32)
    { ds_stack_push(StateStack, s_MOVE); audio_play_sound(Fishman_Cry_snd, 30, false); }
    
    break;
    
    
  case s_MOVE:
    Dir = point_direction(target.x, target.y, x, y);
    spd = 1.5;
    script_execute(Move_Fishman_Ani_scr);
    
    if (distance_to_object(target) >= 6 * 32) { ds_stack_pop(StateStack); }
    
    if (current_time >= timeStamp[4])
    {
        timeStamp[4] = current_time + 300;
        ds_stack_push(StateStack, s_ATTACK1);
    }
    break;
        
    
  case s_ATTACK1:
    var thatWay = point_direction(x, y, target.x, target.y);
  
    spitInst = instance_create(x, y, Bullet_obj);
    spitInst.spawner = id;
    spitInst.speed = 5;
    spitInst.image_angle = thatWay;
    spitInst.direction = thatWay;
    
    spitInst.dmg = 1;
    
    ds_stack_pop(StateStack);
    
    break;
    
    
  default:
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, s_IDLE);
    break;
}


//Reset invulnerability timer once it has finished counting down
if (current_time >= timeStamp[0]) 
{ timeStamp[0] = 0; }
//hurt animation
else
{
    script_execute(Hurt_Fishman_Ani_scr);
}


if (!instance_exists(target))
{
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, -1);
}

//if (place_meeting(x, y, target))
{
    //hurter = target;
    //script_execute(TookDamage_v02_scr(1, 10, 50));
}


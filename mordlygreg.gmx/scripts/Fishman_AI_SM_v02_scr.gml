
switch(State)
{
  case s_ACTIVE:      //if target not found
    if (instance_exists(target)) { State = s_IDLE; }
    break;
    
    
  case s_DAMAGED:
    if (current_time >= timeStamp[0])
    {
        if (healthPoints <= 0) { instance_destroy(); }
        State = s_IDLE;
    }
    if (timeStamp[1] >= current_time)
    { script_execute(Hurt_Fishman_Ani_scr); }
    else {spd = 0;}
    
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
        State = s_ATTACK1;
    }
    else if (distance_to_object(target) <= 3 * 32)
    { State = s_MOVE; audio_play_sound(Fishman_Cry_snd, 30, false); }
    
    break;
    
    
  case s_MOVE:
    Dir = point_direction(target.x, target.y, x, y);
    spd = 1.5;
    script_execute(Move_Fishman_Ani_scr);
    
    if (distance_to_object(target) >= 6 * 32) { State = s_IDLE; }
    
    if (!(current_time >= timeStamp[4]))
    { break; }
    else
    { timeStamp[4] = current_time + 300; }
    
    
  case s_ATTACK1:
    var thatWay = point_direction(x, y, target.x, target.y);
  
    spitInst = instance_create(x, y, Bullet_obj);
    spitInst.spawner = id;
    spitInst.speed = 5;
    spitInst.image_angle = thatWay;
    spitInst.direction = thatWay;
    
    spitInst.dmg = 1;
  
    if (distance_to_object(target) <= 3 * 32) { State = s_MOVE; }
    else { State = s_IDLE; }
    
    break;
    
    
  default:
    State = s_IDLE;
    break;
}

if (!instance_exists(target)) { State = s_ACTIVE; }

if (place_meeting(x, y, target))
{
    hurter = target;
    script_execute(TookDamage_v02_scr(1, 10, 50));
}


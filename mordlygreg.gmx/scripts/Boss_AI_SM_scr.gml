
switch(State)
{
  case -1:      //if target not found, keep checking until found
    if (instance_exists(target)) { State = s_IDLE; }
    break;

  case s_DAMAGED:           //when boss takes damage
    if(current_time >= timeStamp[0])
    {
        if (healthPoints <= 0) { instance_destroy(); }
        State = s_IDLE;
    }
    if (timeStamp[1] >= current_time)
    { sprite_index = Boss_Idle_spr; }       //hurt animation
    else {spd = 0;}
    
    break;
    
    
  case s_IDLE:      //boss can find target, waiting before taking action
    spd = 1;
    Dir = point_direction(x, y, target.x, target.y);
    
    //check player distance, then switch state accordingly
    if (current_time >= timeStamp[2])
    {
        if (distance_to_object(target) <= 4*32)
        {
            spd = 0;
            timeStamp[4] = current_time + 1000;
            State = s_ATTACK4;
        }
        
        else if (distance_to_object(target) <= 12*32)
        {
            spd = 0;
            Grab_Init_scr();
            State = s_ATTACK1;
        }
        
    }
    
    break;
    
    
  case s_MOVE:
    
    break;
        
    
  //Grab Attack, everything is based around this attack
  case s_ATTACK1:
    script_execute(Grab_Update_scr);    //state changes happen inside the script
    timeStamp[2] = current_time + 1000;
    break;
    
    
  //Dash Attack
  case s_ATTACK2:
    //speed lerp over distance
    var lerpI = 1 - (distance_to_point(xMaxSpd, yMaxSpd) / (10*32));
    if (lerpI == 1) {cv = true;}
    
    //check to see if target was passed, then slow down if possible
    var a = point_direction(x, y, target.x, target.y);
    a = angle_difference(Dir, a);
    if (abs(a) >= 90)
    {
        State = s_DODGE;
        xMaxSpd = x + lengthdir_x(spd*32/3, Dir);
        yMaxSpd = y + lengthdir_y(spd*32/3, Dir);
        spdTemp = spd;
    }
    
    //if critical velocity is hit, max out speed
    if (!cv) { spd = lerp(1, 15, lerpI); }
    else { spd = 15; }
  
    //check for collisions and switch states accordingly
    if (place_meeting(x + newX, y + newY, Wall_obj))
    { State = s_IDLE; }
    
    if (place_meeting(x, y, target))
    {
        target.x = x;
        target.y = y;
        
        if (State = s_IDLE)
        {
            with (target) { script_execute(TookDamage_v02_scr(4, 0, 0)); cv = false }
        }
    }
    else if (State = s_IDLE && cv == true)
    {
        hurter = instance_place(x + newX, y + newY, Wall_obj);
        script_execute(TookDamage_v02_scr(2, 0, 0));
        cv = false;
    }
    
    break;
  

  //try and stop dash
  case s_DODGE:
    if (!cv)
    {
        var a = spdTemp/3;
        var lerpI = 1 - (distance_to_point(xMaxSpd, yMaxSpd) / (a*32));
        spd = lerp(spdTemp, 0, lerpI);
    }
    
    if (spd == 0 || place_meeting(x + newX, y + newY, Wall_obj))
    {
        State = s_IDLE;
        if (cv)
        {
            hurter = instance_place(x + newX, y + newY, Wall_obj);
            script_execute(TookDamage_v02_scr(2, 0, 0));
            cv = false;
        }
    }
    
    break;
    
    
  //Dagger attack
  case s_ATTACK3:
    if (current_time >= timeStamp[3])
    { 
        var thing = collision_line(x, y, x+lengthdir_x(5*32, Dir), y+lengthdir_y(5*32, Dir), target, false, false);
        
        if (instance_exists(thing))
        {
            thing.hurter = id;
            with (thing) { script_execute(TookDamage_v02_scr(2, 7, 50)); }
        }
        
        State = s_IDLE;
        timeStamp[2] = current_time + 1000;
    }
    else if (current_time < timeStamp[3] - 300)
    { Dir = point_direction(x, y, target.x, target.y); }
    
    break;
    
    
  //Tentacle knockback
  case s_ATTACK4:
    if (current_time >= timeStamp[4])
    {
        var elipx1;
        var elipx2;
        var elipy1;
        var elipy2;    
    
        if (Dir >= 45 && Dir < 135) 
        { elipx1 = x - 6*32; elipx2 = x + 6*32; elipy1 = y; elipy2 = y - 6*32; }
        else if (Dir >= 135 && Dir < 225)
        { elipx1 = x; elipx2 = x - 6*32; elipy1 = y + 6*32; elipy2 = y - 6*32; }
        else if (Dir >= 225 && Dir < 315)
        { elipx1 = x - 6*32; elipx2 = x + 6*32; elipy1 = y; elipy2 = y + 6*32; }
        else
        { elipx1 = x; elipx2 = x + 6*32; elipy1 = y + 6*32; elipy2 = y - 6*32; }
        
        var thing = collision_ellipse(elipx1, elipy1, elipx2, elipy2, target, false, false);
        
        if (instance_exists(thing))
        {
            var temp = id;
            with (thing)
            {
                script_execute(SetDamageVars_scr(temp, 12, 150, 1, NULL));
                ds_stack_push(StateStack, s_DAMAGED);
            }
            
            
            /*
            thing.hurter = id;
            thing.damage = 1;
            thing.knockbackForce = 12;
            thing.knockbackTime = 150;
            ds_stack_push(target.StateStack, s_DAMAGED);
            */
            
            //with (thing) { script_execute(TookDamage_v02_scr(1, 12, 150)); }
        }
        
        State = s_IDLE;
        timeStamp[2] = current_time + 1000;
    }
    
    break;
    
    
  default:
    if (triggered) { State = s_IDLE; }          //if the player has triggered the boss, start the fight
    else {show_debug_message("Defaulted");}
    break;
}



if (!instance_exists(target)) { State = -1; }

/*
if (place_meeting(x, y, target))    //damage the target if they collide
{
    target.hurter = id;
    with (target)
    { script_execute(TookDamage_v02_scr(1, 7, 100)); }
    timeStamp[2] += 250;
}


switch(ds_stack_top(StateStack))
{
  case -1:      //if target not found, keep checking until found
    if (instance_exists(target)) { State = s_IDLE; }
    break;

    
  case s_DAMAGED:           //when boss takes damage
    ds_stack_pop(StateStack);
    
    if (timeStamp[0] == 0 && !(ds_stack_top(StateStack) == s_ATTACK2 ||
                               ds_stack_top(StateStack) == s_ATTACK3 ||
                               ds_stack_top(StateStack) == s_DODGE)
                               )
    {
        script_execute(TookDamage_v03_scr);
        
        if (healthPoints <= 0) { instance_destroy(); }
    }
    
    break;
  
    /*
    if(current_time >= timeStamp[0])
    {
        if (healthPoints <= 0) { instance_destroy(); }
        State = s_IDLE;
    }
    if (timeStamp[1] >= current_time)
    { sprite_index = Boss_Idle_spr; }       //hurt animation
    else {spd = 0;}
    
    break;
    */
    
    
  case s_STUNED:
    if (current_time >= timeStamp[1])
    {
        ds_stack_pop(StateStack);
    }
    
    break;
    
    
  case s_IDLE:      //boss can find target, waiting before taking action
    spd = 1;
    Dir = point_direction(x, y, target.x, target.y);
    
    //check player distance, then switch state accordingly
    //decision making time
    if (current_time >= timeStamp[2])
    {
        if (distance_to_object(target) <= 4*32)
        {
            spd = 0;
            //timeStamp[4] = current_time + 1000;     //gives a 1 second wind up to sweep attack
            //ds_stack_push(StateStack, s_ATTACK5);
        }
        
        else if (distance_to_object(target) <= 12*32)
        {
            spd = 0;
            
            //create arm to be manipulated for grab
            arm = instance_create(x, y, GrabArm_obj);
            arm.speed = 16;
            arm.direction = Dir;
            
            ds_stack_push(StateStack, s_ATTACK1);
        }
        
    }
    
    break;
        
    
  //Grab Attack, everything is based around this attack
  case s_ATTACK1:
    with (arm)
    {
        grabbed = instance_place(x, y, all);
        
        if (grabbed == noone) {grabbed = -10;}  //enter null data if nothing found
        else {grabbed = grabbed.object_index;}  //set up grabbed for switch statement
        
        //do something different based on what was grabbed
        switch (grabbed)
        {
          case (Wall_obj):
            with (Boss_obj)
            {
                Dir = point_direction(x, y, arm.x, arm.y);
                xMaxSpd = x + lengthdir_x(10*32, Dir);
                yMaxSpd = y + lengthdir_y(10*32, Dir);

                ds_stack_push(StateStack, s_ATTACK2);
            }
            instance_destroy();
            
            break;
         
          case (Player02_obj):
            with(Boss_obj)
            {
                ds_stack_push(StateStack, s_ATTACK3); 
            
                with (target)
                {
                    spd = 5;
                    Dir = point_direction(x, y, Boss_obj.x, Boss_obj.y);
                    ds_stack_push(StateStack, s_STUNED);
                    timeStamp[1] = current_time + 10000;
                }
            }
            
            instance_destroy();
          
            /*
            grabbed.x = x;
            grabbed.y = y - 33;
            
            direction = point_direction(x, y, Boss_obj.x, Boss_obj.y);
            speed = 5;
             
            with (Boss_obj)
            {
                if (place_meeting(x, y, target))
                {
                    with(arm) {instance_destroy();} 
                    
                    timeStamp[3] = current_time + 1000;
                    ds_stack_push(StateStack, s_ATTACK3);
                }
            }
            */
            
            break;
               
        }   //switch end
    
    }
    break;
    
    
  //Dash Attack
  case s_ATTACK2:
    //speed lerp over distance
    var lerpI = 1 - (distance_to_point(xMaxSpd, yMaxSpd) / (10*32));
    if (lerpI == 1) {cv = true;}
    
    //check to see if target was passed, then slow down if possible
    var a = point_direction(x, y, target.x, target.y);
    a = angle_difference(Dir, a);
    if (abs(a) >= 90 && !place_meeting(x, y, target))
    {
        ds_stack_push(StateStack, s_DODGE);
        xMaxSpd = x + lengthdir_x(spd*32/3, Dir);
        yMaxSpd = y + lengthdir_y(spd*32/3, Dir);
        spdTemp = spd;
    }
    
    //if critical velocity is hit, max out speed
    if (!cv) { spd = lerp(1, 15, lerpI); }
    else { spd = 15; }
  
    //check for collisions and switch states accordingly
    if (place_meeting(x + newX, y + newY, Wall_obj))
    { ds_stack_clear(StateStack); ds_stack_push(StateStack, s_IDLE); }
    
    if (place_meeting(x, y, target))
    {
        target.x = x;
        target.y = y;
        
        if (ds_stack_top(StateStack) == s_IDLE)
        {
            var t = id;
            with (target)
            {
                script_execute(SetDamageVars_scr(t, 0, 250, 4, NULL));
                ds_stack_push(StateStack, s_DAMAGED);
            }    
            cv = false;
        }
    }
    else if (ds_stack_top(StateStack) == s_IDLE && cv == true)
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
        ds_stack_clear(StateStack);
        ds_stack_push(StateStack, s_IDLE);
        timeStamp[2] = current_time + 1000;
        
        if (cv)
        {
            ds_stack_push(StateStack, s_STUNED);
            spd = 0;
            timeStamp[1] = current_time + 750;            
            timeStamp[2] += 750;
            cv = false;
        }
    }
    
    break;
    
    
  //pull target
  case s_ATTACK3:
  
    if (distance_to_object(target) <= 16 && timeStamp[5] == 0 && timeStamp[6] == 0)
    {
        target.spd = 0;
        timeStamp[5] = current_time + 250;
    }
    
    if (current_time >= timeStamp[5] && timeStamp[5] != 0)
    {
        //var walled = collision_circle(x, y, 12*32, Wall_obj, false, false);
        var walled = 0;
        for (var i = 0; i < 360; i += 10)
        {
            var wallx = lengthdir_x(12*32, i);
            var wally = lengthdir_y(12*32, i);
            
            if (place_meeting(x+wallx, y+wally, Wall_obj))
            { walled = instance_place(x+wallx, y+wally, Wall_obj); show_debug_message(i); i = 360; }
        }
        
        var rmcenx = room_width/2;
        var rmceny = room_height/2;
        
        
        if (distance_to_point(rmcenx, rmceny) >= 6*32)
        {
            target.Dir = point_direction(x, y, rmcenx, rmceny);
            target.spd = 9;
            
            timeStamp[6] = current_time + 750;
        }
        else
        {
            timeStamp[3] = current_time + 750;
            ds_stack_push(StateStack, s_ATTACK4);
            
            target.spd = 0;
            target.timeStamp[1] = current_time+100;
        }
        
        timeStamp[5] = 0;
    }
    
    if (timeStamp[6] != 0)
    {
        if (current_time >= timeStamp[6])
        {
            target.spd = 0;
            target.timeStamp[1] = current_time + 150;
            
            ds_stack_pop(StateStack);
            timeStamp[6] = 0;
        }
        else if (current_time >= timeStamp[6] - 200 && !instance_exists(arm))
        {      
            arm = instance_create(x, y, GrabArm_obj);
            arm.speed = 16;
            arm.direction = target.Dir-7; //+ 5 * sign(random_range(-1, 1)));
        }
    }
    
    break;
    
    
  //Dagger attack
  case s_ATTACK4:
    if (current_time >= timeStamp[3])
    { 
        var thing = collision_line(x, y, x+lengthdir_x(5*32, Dir), y+lengthdir_y(5*32, Dir), target, false, false);
        
        if (instance_exists(thing))
        {
            var t = id;
            with (thing)
            {
                script_execute(SetDamageVars_scr(t, 7, 50, 2, NULL));
                ds_stack_push(StateStack, s_DAMAGED);
            }
        }
        
        ds_stack_clear(StateStack);
        ds_stack_push(StateStack, s_IDLE);
        timeStamp[2] = current_time + 1000;
    }
    else if (current_time < timeStamp[3] - 300)
    { Dir = point_direction(x, y, target.x, target.y); }
    
    break;
    
    
  //Tentacle knockback
  case s_ATTACK5:
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
        
        ds_stack_pop(StateStack);
        timeStamp[2] = current_time + 1000;
    }
    
    break;
    
    
  default:
    if (triggered) { State = s_IDLE; }          //if the player has triggered the boss, start the fight
    else {show_debug_message("Defaulted");}
    break;
}


if (current_time >= timeStamp[0]) { timeStamp[0] = 0; }


if (!instance_exists(target)) { State = -1; }

/*
if (place_meeting(x, y, target))    //damage the target if they collide
{
    target.hurter = id;
    with (target)
    { script_execute(TookDamage_v02_scr(1, 7, 100)); }
    timeStamp[2] += 250;
}


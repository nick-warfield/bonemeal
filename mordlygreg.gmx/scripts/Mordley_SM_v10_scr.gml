//REQUIRES:
//

if (global.paused) {exit;}


//Reset invulnerability timer once it has finished counting down
if (current_time >= timeStamp[0]) 
{ timeStamp[0] = 0; image_alpha = 1; }
//flashing effect while invulnerable
else if (ds_stack_top(StateStack) != s_STUNED && current_time <= timeStamp[0]-100) 
{
    if (current_time >= timeStamp[1])
    {
        if (image_alpha == 1) {image_alpha = 0.2;} else {image_alpha = 1;}
        timeStamp[1] = current_time + 75;
    }
}


switch (ds_stack_top(StateStack))
{
  case (s_DAMAGED):
    //pop off damage state so that the last state can be read
    ds_stack_pop(StateStack);
    
    //check to see if charater can be damaged
    if (timeStamp[0] == 0 && ds_stack_top(StateStack) != s_DODGE)
    { script_execute(TookDamage_v03_scr); }
    
    if (healthPoints <= 0) {script_execute(Checkpoint_Manager_scr(id));}
    
    break;
    
    
  //do nothing, ignores all inputs so that player will maintain spd and Dir it had on entering stun
  case (s_STUNED):
    if (current_time >= timeStamp[1])
    {
        if (timeStamp[7] == 0)
        { ds_stack_pop(StateStack); }
        else
        {
            timeStamp[1] = abs(timeStamp[7]-timeStamp[1]) + current_time;
            timeStamp[7] = 0;
            spd = 0;
        }
    }
    
    break;
    
    
  case (s_MOVE):
    script_execute(Move_v05_scr);   //standard move script
    
    script_execute(Move_Mordley_Ani_scr);       //the sprites used while moving, and how they are updated
                                                //also update facing, so that the Direction of the player is independent
                                                //from which way the sprite is facing
                                                
    //Transitions to other states
    if (Input[DODGE] && current_time >= timeStamp[6])
    {
        ds_stack_push(StateStack, s_DODGE);
        timeStamp[5] = current_time + 200;
    }
    
    else if (Input[INTERACT])
    {
        script_execute(Interact_v03_scr);
        ds_stack_push(StateStack, s_INTERACT);
        
        if (Camera_obj.done)
        {
            ds_stack_pop(StateStack);
            ds_stack_push(StateStack, s_ATTACK1);
            timeStamp[2] = current_time + 600;
            audio_play_sound(UmbrellaCombo_swing02_snd, 50, false);
            image_index = 0;
            
            comboCount = 1;
        }
    }
    
    else if (Input[ATTACK1])    //swing
    {
        ds_stack_push(StateStack, s_PARRY);
        audio_play_sound(UmbrellaCombo_swing02_snd, 50, false);
        timeStamp[2] = current_time + 100;
        image_index = 0;
    }
    
    else if (Input[PARRY])      //parry
    {
        ds_stack_push(StateStack, s_PARRY);
        timeStamp[2] = 0;
    }
    
    else if (Input[ATTACK3])    //aim
    {
        ds_stack_push(StateStack, s_ATTACK3);
    }
    
    else if (Input[ATTACK4])    //reload
    {
        ds_stack_push(StateStack, s_ATTACK4);
        timeStamp[4] = current_time + 300;
        var reload2 = audio_play_sound(Reload_snd, 50, false);
        audio_sound_pitch(reload2, 0.7);
    }
    
    else if (Input[ATTACK5])    //cycle
    {
        ds_stack_push(StateStack, s_ATTACK5);
        timeStamp[3] = current_time + 750;
    }
    
    break;
    
  //dodge
  case (s_DODGE):
    spd = 9;

    if (current_time >= timeStamp[5])
    {
        ds_stack_pop(StateStack);
        timeStamp[6] = current_time + 800;
    }
    
    break;
    
  //Interact with stuff
  case (s_INTERACT):
    spd = 0;
    if (Camera_obj.done == true)
    {
        ds_stack_pop(StateStack);
    }
    
    break;
    
  
  //Parry something
  case (s_PARRY):
    script_execute(Swing_scr);
    script_execute(Parry_v02_scr);
    script_execute(Attack_Old_Mordley_Ani_scr);
    spd = 0;
    
    if (current_time >= timeStamp[2])      //exit condition for the parry
    {
        ds_stack_pop(StateStack);
    }
    
    break;

    
  //umbrella swing    
  case (s_ATTACK1):
    spd = 2;                         //stop player while swinging
    
    switch (comboCount)
    {
      case 1:
        if (image_speed > 0) {script_execute(Swing_v02_scr);}
        script_execute(Attack_Mordley_Ani_scr(Mordley_Combo1_Side_spr, Mordley_Combo1_Back_spr, Mordley_Combo1_Front_spr, 12));
        
        if (image_index >= image_number - 2 && Input[INTERACT])
        {
            timeStamp[2] = current_time + 600;
            audio_play_sound(UmbrellaCombo_swing02_snd, 50, false);
            
            script_execute(Attack_Mordley_Ani_scr(Mordley_Combo2_Side_spr, Mordley_Combo2_Back_spr, Mordley_Combo2_Front_spr, 12));
            image_index = 0;
            
            comboCount++;
        }
        
        break;
        
      case 2:
        if (image_speed > 0) {script_execute(Swing_v02_scr);}
        script_execute(Attack_Mordley_Ani_scr(Mordley_Combo2_Side_spr, Mordley_Combo2_Back_spr, Mordley_Combo2_Front_spr, 12));
        
        if (image_speed <= 0 && Input[INTERACT])
        {
            timeStamp[2] = current_time + 600;
            audio_play_sound(UmbrellaCombo_swing02_snd, 50, false);
            
            script_execute(Attack_Mordley_Ani_scr(Mordley_Combo3_Side_spr, Mordley_Combo3_Back_spr, Mordley_Combo3_Front_spr, 12));
            image_index = 0;
            
            comboCount++;
        }
        
        break;
        
      case 3:
        if (image_speed > 0) {script_execute(Swing_Spin_scr);}
        script_execute(Attack_Mordley_Ani_scr(Mordley_Combo3_Side_spr, Mordley_Combo3_Back_spr, Mordley_Combo3_Front_spr, 12));
        
        break;
    }        

    show_debug_message(comboCount);
    
    if (current_time >= timeStamp[2])           //Revert back to the move state
    {
        ds_stack_pop(StateStack);
    }
    else if (current_time >= timeStamp[2] - 400) {spd = 0;}

    break;
    
    
  //Fire Gun
  case (s_ATTACK2):
    script_execute(Shoot_Revolver_scr);   //Spawn bullet if the current chamber is loaded, then empty it
    //script_execute(Cycle_scr);          //Cycle the cylinder after shooting, even if the chamber was empty
    
    ds_stack_pop(StateStack);               //remove shooting state from stack
    ds_stack_push(StateStack, s_ATTACK5, s_STUNED);   //add the stuned state to stack for knockback effect

    break;
    
    
  //Aim Gun
  case (s_ATTACK3):
    spd = 0;                     //keep the player from moving while aiming
    script_execute(Aim_v02_scr);            //Updates the direction of mordley
    script_execute(Aim_Mordley_Ani_scr);   //Updates the sprite and facing variable

    if (Input[DODGE] && current_time >= timeStamp[6]) 
    {
        timeStamp[5] = current_time + 200;
        ds_stack_push(StateStack, s_DODGE);
    }
    
    if (Input[ATTACK2] && current_time >= timeStamp[3])
    {
        ds_stack_push(StateStack, s_ATTACK2);    //go to shooting state on fire input
        timeStamp[3] = current_time + 750;
    }
    if (Input[ATTACK5]) { script_execute(Cycle_scr); }
    if (!Input[ATTACK3])    //go back to moving state on aim input release
    {
        ds_stack_pop(StateStack);
    }
    
    break;
   
     
  //Reload
  case (s_ATTACK4):
    if (current_time >= timeStamp[4])   //reload at the end of the timer
    {
        script_execute(Reload_scr);     //fills the next chamber with bullet
        ds_stack_pop(StateStack);                 //revert back to move state
    }
    
    script_execute(Move_v05_scr);       //allow for movement while reloading
    //spd /= 3;
    
    break;
    
    
  //Cycle Cylinder
  case (s_ATTACK5):     //need to make cycling independent of everything, it just updates the chamber after the gui animation is done
    script_execute(Cycle_scr);
    ds_stack_pop(StateStack);  //revert back to moving state after cycle
    
    break;
    
    
  //go back to the moving state in case State gets set to something nonexistent
  default:
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, s_MOVE);
    break;
}

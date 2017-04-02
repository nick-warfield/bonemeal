//REQUIRES:
//


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
    
    break;
    
    
  //do nothing, ignores all inputs so that player will maintain spd and Dir it had on entering stun
  case (s_STUNED):
    if (current_time >= timeStamp[1]) { ds_stack_pop(StateStack); }
    break;
    
    
  case (s_MOVE):
    script_execute(Move_v05_scr);   //standard move script
    
    script_execute(Move_Mordley_Ani_scr);       //the sprites used while moving, and how they are updated
                                                //also update facing, so that the Direction of the player is independent
                                                //from which way the sprite is facing


    if (stamina >= staminaMax) { stamina = staminaMax; }
    else if (current_time >= timeStamp[6]) { stamina += 0.5; }
                                                
    //Transitions to other states
    if (Input[DODGE] && stamina > 0)
    {
        ds_stack_push(StateStack, s_DODGE);
        //StateArray[0] = s_DODGE;
        timeStamp[5] = current_time + 150;
        stamina -= 26;
    }
    
    else if (Input[INTERACT])
    {
        script_execute(Interact_v02_scr);
        ds_stack_push(StateStack, s_INTERACT);
    }
    
    else if (Input[ATTACK1] && stamina > 0)    //swing
    {
        ds_stack_push(StateStack, s_ATTACK1);
        timeStamp[2] = current_time + 200;
        audio_play_sound(Swing_Umbrella_snd, 50, false);
        stamina -= 10;
    }
    
    else if (Input[PARRY] && stamina > 0)      //parry
    {
        ds_stack_push(StateStack, s_PARRY);
        timeStamp[2] = 0;
        stamina -= 20;
    }
    
    else if (Input[ATTACK3])    //aim
    {
        ds_stack_push(StateStack, s_ATTACK3);
    }
    
    else if (Input[ATTACK4])    //reload
    {
        ds_stack_push(StateStack, s_ATTACK4);
        timeStamp[4] = current_time + 750;
        spd = 1;
        audio_play_sound(Reload_Gun_snd, 50, false);
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
        timeStamp[6] = current_time + 2000;
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
    script_execute(Move_v05_scr);
    script_execute(Move_Mordley_Ani_scr);
    spd /= 2;
    
    if (current_time >= timeStamp[2] && timeStamp[2] != 0)      //exit condition for the parry
    {
        ds_stack_pop(StateStack);
        timeStamp[6] = current_time + 2000;
    }
    
    if (!Input[PARRY])      //when the parry button is released, start the parry
    {
        spd = 0;
        script_execute(Parry_v02_scr);
        script_execute(Attack_Mordley_Ani_scr);
        if (current_time >= timeStamp[2] && ds_stack_top(StateStack) == s_PARRY)    //set the timer for how long the parry window is
        {
            timeStamp[2] = current_time + 50;
            audio_play_sound(Swing_Umbrella_snd, 50, false);
        }
    }
    
    break;

    
  //umbrella swing    
  case (s_ATTACK1):
    spd = 0;                         //stop player while swinging
    script_execute(Swing_scr);                  //swing in the direction the player is currently facing, not their current direction
    script_execute(Attack_Mordley_Ani_scr);     //Display the correct attack sprite based on which way the player is facing

    if (current_time >= timeStamp[2])           //Revert back to the move state
    {
        ds_stack_pop(StateStack);
        timeStamp[6] = current_time + 2000;
    }

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

    
    if (stamina >= staminaMax) { stamina = staminaMax; }
    else if (current_time >= timeStamp[6]) { stamina += 0.15; }
    
    if (Input[DODGE] && stamina > 0) 
    {
        timeStamp[5] = current_time + 150;
        ds_stack_push(StateStack, s_DODGE);
        stamina -= 26;
    }
    
    if (Input[ATTACK2] && current_time >= timeStamp[3] && stamina > 0)
    {
        ds_stack_push(StateStack, s_ATTACK2);    //go to shooting state on fire input
        timeStamp[3] = current_time + 750;
        timeStamp[6] = current_time + 2000;
    }
    if (Input[ATTACK5]) { script_execute(Cycle_scr); }
    if (!Input[ATTACK3])    //go back to moving state on aim input release
    {
        ds_stack_pop(StateStack);
    }
    
    break;
   
     
  //Reload
  case (s_ATTACK4):
    if (Input[DODGE])       //exit reload if player wants to dodge
    {
        timeStamp[5] = current_time + 150;
        ds_stack_pop(StateStack);       //pop off the reload state
        ds_stack_push(StateStack, s_DODGE);     //push in move state then dodge state, that way when dodges pops itself off the stack isn't empty
        stamina -= 26;
    }
    
    if (stamina >= staminaMax) { stamina = staminaMax; }
    else if (current_time >= timeStamp[6]) { stamina += 0.15; }
    
    if (current_time >= timeStamp[4])   //reload at the end of the timer
    {
        script_execute(Reload_scr);     //fills the next chamber with bullet
        spd = 3;                       //restore speed back to normal
        ds_stack_pop(StateStack);                 //revert back to move state
    }
    
    script_execute(Move_v05_scr);       //allow for movement while reloading
    spd /= 3;
    
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

//REQUIRES:
//

//running the current move script makes things unstable,
//have implemented an awful substitute to avoid this
//I'll put everything in without using script execute in this version, that way I can visualize all of the code opperating at once

switch (State)
{
  case (s_DAMAGED):
    show_debug_message("TOOK DAMAGE");
    
    
    
  case (s_MOVE):
    script_execute(Move_v04_scr);   //standard move script
    
    script_execute(Move_Mordley_Ani_scr);       //the sprites used while moving, and how they are updated
                                                //also update facing, so that the Direction of the player is independent
                                                //from which way the sprite is facing

    //Transitions to other states
    if (Input[DODGE])
    {
        State = s_DODGE;
        timeStamp[4] = current_time + 150;
    }
    
    else if (Input[INTERACT])
    { State = s_INTERACT; }
    
    else if (Input[ATTACK1])    //swing
    {
        State = s_ATTACK1;
        timeStamp[1] = current_time + 200;
    }
    
    else if (Input[ATTACK3])    //aim
    { State = s_ATTACK3; }
    
    else if (Input[ATTACK4])    //reload
    {
        State = s_ATTACK4;
        timeStamp[3] = current_time + 750;
        spd /= 3;
    }
    
    else if (Input[ATTACK5])    //cycle
    {
        State = s_ATTACK5;
        timeStamp[2] = current_time + 750;
    }
    
    break;
    
  //dodge
  case (s_DODGE):
    motion_set(Dir, spd * 3);    
    
    if (current_time >= timeStamp[4]) { State = s_MOVE; }
    
    break;
    
  //Interact with stuff
  case (s_INTERACT):
    show_debug_message("Talking");      //Interact code here
  
    State = s_MOVE;
    
    break;

    
  //umbrella swing    
  case (s_ATTACK1):
    motion_set(Dir, 0);                         //stop player while swinging
    script_execute(Swing_scr);                  //swing in the direction the player is currently facing, not their current direction
    script_execute(Attack_Mordley_Ani_scr);     //Display the correct attack sprite based on which way the player is facing

    if (current_time >= timeStamp[1]) { State = s_MOVE; }   //Revert back to the Move state

    break;
    
    
  //Fire Gun
  case (s_ATTACK2):
    script_execute(Shoot_Simple_scr);   //Spawn bullet if the current chamber is loaded, then empty it
    script_execute(Cycle_scr);          //Cycle the cylinder after shooting, even if the chamber was empty
    
    State = s_ATTACK3;      //Switch state back to aiming
    
    break;
    
    
  //Aim Gun
  case (s_ATTACK3):
    motion_set(Dir, 0);                     //keep the player from moving while aiming
    script_execute(Aim_v02_scr);            //Updates the direction of mordley
    script_execute(Move_Mordley_Ani_scr);   //Updates the sprite and facing variable

    if (Input[DODGE]) 
    {
        timeStamp[4] = current_time + 150;
        State = s_DODGE;
    }
    
    if (Input[ATTACK2] && current_time >= timeStamp[2])
    {
        State = s_ATTACK2;    //go to shooting state on fire input
        timeStamp[2] = current_time + 750;
    }
    if (!Input[ATTACK3]) { State = s_MOVE; }    //go back to moving state on aim input release
    
    break;
   
     
  //Reload
  case (s_ATTACK4):
    if (Input[DODGE])       //exit reload if player wants to dodge
    {
        spd *= 3;
        timeStamp[4] = current_time + 150;
        State = s_DODGE;
    }
    
    if (current_time >= timeStamp[3])   //reload at the end of the timer
    {
        script_execute(Reload_scr);     //fills the next chamber with bullet
        spd *= 3;                       //restore speed back to normal
        State = s_MOVE;                 //revert back to move state
    }
    
    script_execute(Move_v04_scr);       //allow for movement while reloading
    
    break;
    
    
  //Cycle Cylinder
  case (s_ATTACK5):     //need to make cycling independent of everything, it just updates the chamber after the gui animation is done
    script_execute(Cycle_scr);
    State = s_ATTACK3;  //revert back to moving state after cycle
    
    break;
    
    
  //go back to the moving state in case State gets set to something nonexistent
  default:
    State = s_MOVE;
    break;
}

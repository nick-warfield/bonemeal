//REQUIRES:
//

//running the current move script makes things unstable,
//have implemented an awful substitute to avoid this
//I'll put everything in without using script execute in this version, that way I can visualize all of the code opperating at once

switch (State)
{
  case (s_DAMAGED):
    show_debug_message("TOOK DAMAGE");
    

  case (s_IDLE):
    
    
  case (s_MOVE):
    //move bad script, less featured but is actually stable
    if (Input[RIGHT])
    { hspeed = spd; }
    else if (Input[LEFT])
    { hspeed = -spd; }
    else { hspeed = 0; }
    
    if (Input[UP])
    { vspeed = -spd; }
    else if (Input[DOWN])
    { vspeed = spd; }
    else { vspeed = 0; }
    
    
    if (vspeed > 0) { sprite_index = Mordley_Front_spr; image_xscale = 1; }
    else if (hspeed > 0) { sprite_index = Mordley_Side_spr; image_xscale = 1; }
    else if (hspeed < 0) { sprite_index = Mordley_Side_spr; image_xscale = -1; }
    else if (vspeed < 0) { sprite_index = Mordley_Back_spr; image_xscale = 1; }
    
        
    //Transitions to other states
    if (Input[DODGE])
    {
        State = s_DODGE;
    }
    
    else if (Input[INTERACT])
    {
        State = s_INTERACT;
    }
    
    else if (Input[ATTACK1])
    {
        State = s_ATTACK1;
    }
    
    else if (Input[ATTACK3])
    {
        State = s_ATTACK3;
    }
    
    else if (Input[ATTACK4])
    {
        State = s_ATTACK4;
    }
    
    else if (Input[ATTACK5])
    {
        State = s_ATTACK5;
    }
    
    break;
    
  case (s_DODGE):
    //Dodge code here
    show_debug_message("Dodge");
    
    State = s_IDLE;
    break;
    
  case (s_INTERACT):
    //Interact code here
    show_debug_message("Talking");
  
    State = s_IDLE;
    break;

  //umbrella swing    
  case (s_ATTACK1):
    //swing code here
    
    if (direction == 0)
    {
        var thing = collision_circle(x + 32, y, 32, Character_obj, false, true);
    }
    else if (direction == 180)
    {
        var thing = collision_circle(x - 32, y, 32, Character_obj, false, true);
    }
    else if (direction == 90)
    {
        var thing = collision_circle(x, y - 48, 32, Character_obj, false, true);
    }
    else if (direction == 270)
    {
        var thing = collision_circle(x, y + 48, 32, Character_obj, false, true);
    }

    if (thing != id)
    {
        with (thing) { script_execute(TookDamage_scr, 2, 50, id); }
    }
    
        
    if (direction == 0)
    {
        sprite_index = Mordley_Attk_Side_spr
        image_xscale = 1;
    }
    else if (direction == 180)
    {
        sprite_index = Mordley_Attk_Side_spr
        image_xscale = -1;
    }
    else if (direction == 90)
    {
        sprite_index = Mordley_Attk_Back_spr
        image_xscale = 1;
    }
    else if (direction == 270)
    {
        sprite_index = Mordley_Attk_Front_spr
        image_xscale = 1;
    }
  
    State = s_IDLE;
    break;
    
  //Fire Gun
  case (s_ATTACK2):
    //gun code here
    show_debug_message("bang");
    
    bulletInst = instance_create(x, y, Bullet_obj);
    
    //set reference to the object that spawns the projectile
    bulletInst.spawner = id;
    //initialize the projectiles speed and direction
    bulletInst.speed = 10;
    bulletInst.image_angle = id.direction;
    bulletInst.direction = id.direction;

    State = s_ATTACK5;
    break;
    
  //Aim Gun
  case (s_ATTACK3):
    //aim gun code
    
    if(Input[DOWN] == false && Input[UP] == false && Input[RIGHT] == false && Input[LEFT] == false)
    {
        direction = facing;
    }
    else
    {
        if(Input[UP] == true)
        {
            facing = UP;
        }
        if(Input[DOWN] == true)
        {
            facing = DOWN;
        }
        if(Input[RIGHT] == true)
        {
            facing = RIGHT;
        }
        if(Input[LEFT] == true)
        {
            facing = LEFT;
        }
        
        facing *= 90;
        direction = facing;
    }
    if (direction >= 45 && direction < 135) { direction = 90; }
    if (direction >= 135 && direction < 225) { direction = 180; }
    if (direction >= 225 && direction < 315) { direction = 270; }
    if (direction >= 315 && direction < 45) { direction = 0; }
    
    hspeed = 0;
    vspeed = 0;
    
    if (Input[ATTACK2]) { State = s_ATTACK2; }
    if (!Input[ATTACK3]) { State = s_MOVE; }
    
    break;
    
  //Reload
  case (s_ATTACK4):
    //new reload, individual bullets
    if (timeStamp[3] == 0)
    {
        state[s_ACTIVE] = state[s_ATTACK4];
        spd /= 3;
        timeStamp[3] = current_time + 500;
    }
    else if (current_time >= timeStamp[3])
    {
        spd *= 3;
        timeStamp[3] = 0;
        State = s_IDLE;
    }
    
    //move bad script, less featured but is actually stable
    if (Input[RIGHT])
    { hspeed = 1 * spd; }
    
    else if (Input[LEFT])
    { hspeed = -1 * spd; }
    
    else { hspeed = 0; }
    
    if (Input[UP])
    { vspeed = -1 * spd; }
    
    else if (Input[DOWN])
    { vspeed = 1 * spd; }
    
    else { vspeed = 0; }
    
    
    break;
    
  //Cycle Cylinder
  case (s_ATTACK5):
    cylinderPosition += 1;
    if (cylinderPosition >= 6) { cylinderPosition = 0; }
    show_debug_message(cylinderPosition);
    show_debug_message(cylinder[cylinderPosition]);
    
    State = s_ATTACK3;
    break;
    
    
  default:
    State = s_MOVE;
    break;
}

//show_debug_message(State);

/*




//set active to idle by default
state[s_ACTIVE] = state[s_IDLE];

//set active to aiming if aiming
if(Input[ATTACK3])
{ state[s_ACTIVE] = state[s_ATTACK3]; }

//set active to dodging if dodging
if(Input[DODGE])
{ state[s_ACTIVE] = state[s_DODGE]; }


//only switch to another state if the current one is not dodge
if(state[s_ACTIVE] != state[s_DODGE])
{
    //available states while aiming
    if(state[s_ACTIVE] == state[s_ATTACK3])
    {
        //fire gun if aiming, .75 seconds between shots
        if (Input[ATTACK2] && current_time >= timeStamp[2])
        {
            //determines fire rate
            timeStamp[2] = current_time + 750;
            
            //spawns bullet
            state[s_ACTIVE] = state[s_ATTACK2];    
        }
        
        //cycle command handled after script_execute(state[s_ACTIVE])
    }
    
    //available states while not aiming
    else
    {
        //if interact input detected, interact script
        if(Input[INTERACT])
        {
            state[s_ACTIVE] = state[s_INTERACT];
        }
        
        //set move state if move input detected
        if(Input[UP] || Input[DOWN] || Input[RIGHT] || Input[LEFT])
        {
            state[s_ACTIVE] = state[s_MOVE];
        }
        
        //use a timestamp to keep setting the active state to Attacking while it is in the middle of the animation
        //swing umbrella
        if(Input[ATTACK1])
        {
            state[s_ACTIVE] = state[s_ATTACK1];
        }
        
        //new reload, individual bullets
        if (Input[ATTACK4] == true && timeStamp[3] == 0)
        {
            state[s_ACTIVE] = state[s_ATTACK4];
            spd /= 3;
            timeStamp[3] = current_time + 500;
        }
        if (current_time >= timeStamp[3] && timeStamp[3] != 0)
        {
            spd *= 3;
            timeStamp[3] = 0;
        }
    }
}



//if interact input detected, interact script
if(Input[INTERACT])
{
    state[s_ACTIVE] = state[s_INTERACT];
}

//set move state if move input detected
if(Input[UP] || Input[DOWN] || Input[RIGHT] || Input[LEFT])
{
    state[s_ACTIVE] = state[s_MOVE];
}

//use a timestamp to keep setting the active state to Attacking while it is in the middle of the animation
//swing umbrella
if(Input[ATTACK1])
{
    state[s_ACTIVE] = state[s_ATTACK1];
}

//aim gun before firing
if(Input[ATTACK3])
{
    state[s_ACTIVE] = state[s_ATTACK3];
}

//fire gun if aiming, .75 seconds between shots
if (state[s_ACTIVE] == state[s_ATTACK3] && Input[ATTACK2] 
    && current_time >= timeStamp[2])
{
    //determines fire rate
    timeStamp[2] = current_time + 750;
    
    //spawns bullet
    state[s_ACTIVE] = state[s_ATTACK2];    
}

//new reload, individual bullets
if (Input[ATTACK4] == true && timeStamp[3] == 0)
{
    state[s_ACTIVE] = state[s_ATTACK4];
    spd /= 3;
    timeStamp[3] = current_time + 500;
}
if (current_time >= timeStamp[3] && timeStamp[3] != 0)
{
    spd *= 3;
    timeStamp[3] = 0;
}

//cycle command handled after script_execute(state[s_ACTIVE])



//if player is moving and hits the dodge button, set state to dodge
if(state[s_ACTIVE] == state[s_MOVE] && Input[DODGE])
{
    state[s_ACTIVE] = state[s_DODGE];
}


//execute the script stored in the active state
script_execute(state[s_ACTIVE]);


//cycle chamber on button input or shoot
if(Input[ATTACK5] == true || state[s_ACTIVE] == state[s_ATTACK2])
{
    //state[s_ACTIVE] = state[s_ATTACK5];
    cylinderPosition += 1;
    if (cylinderPosition >= 6) { cylinderPosition = 0; }
    show_debug_message(cylinderPosition);
    show_debug_message(cylinder[cylinderPosition]);
}


//kill object if hp runs out
if (healthPoints <= 0)
{
    instance_destroy();
}

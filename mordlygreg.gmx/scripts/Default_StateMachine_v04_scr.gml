//REQUIRES:
//initialization_scr

//State Machine


//attack1 = umbrella swing
//attack2 = fire gun
//attack3 = aim gun


//states higher up have less priority then scripts lower down,
//because lower scripts can override them

//some states may not give control back immediately,
//for example the dodge script wont return control the state machine 
//until the player finishes dodging


//set active to idle by default
state[s_ACTIVE] = state[s_IDLE];

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

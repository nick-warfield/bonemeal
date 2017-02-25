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

//fire gun if aiming
if(state[s_ACTIVE] == state[s_ATTACK3] && Input[ATTACK2])
{
    state[s_ACTIVE] = state[s_ATTACK2];
}

//if player is moving and hits the dodge button, set state to dodge
if(state[s_ACTIVE] == state[s_MOVE] && Input[DODGE])
{
    state[s_ACTIVE] = state[s_DODGE];
}



//execute the script stored in the active state
//show_debug_message(state[s_ACTIVE]);
script_execute(state[s_ACTIVE]);


//kill object if hp runs out
if (healthPoints <= 0)
{
    instance_destroy();
}


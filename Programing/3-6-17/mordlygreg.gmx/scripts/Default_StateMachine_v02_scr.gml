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
if(Input[UP] || Input[DOWN] || Input[RIGHT] || Input[LEFT] && state[s_ACTIVE] != state[s_DODGE])
{
    state[s_ACTIVE] = state[s_MOVE];
}

//use a timestamp to keep setting the active state to Attacking while it is in the middle of the animation
//swing umbrella
if(Input[ATTACK1])
{
    state[s_ACTIVE] = state[s_ATTACK1];
    timeStamp_stamina = current_time + 2500;
}

//aim gun before firing
if(Input[ATTACK3])
{
    state[s_ACTIVE] = state[s_ATTACK3];
}

//fire gun if aiming, .75 seconds between shots
if(state[s_ACTIVE] == state[s_ATTACK3] && Input[ATTACK2] 
   && current_time >= timeStamp[2] && ammunition > 0)
{
    state[s_ACTIVE] = state[s_ATTACK2];
    ammunition--;
    
    timeStamp[2] = current_time + 750;
    timeStamp_stamina = current_time + 2500;
}

//reload gun, 3 second reload, player speed 1/3 while reloading
if (ammunition < 6 && Input[ATTACK4] == true)
{
    if (timeStamp[3] == 0)
    {
        spd /= 3;
        timeStamp[3] = current_time + 3000;
        show_debug_message("reload start");
    }
}
if (current_time >= timeStamp[3] && timeStamp[3] != 0)
{
    ammunition = 6;
    spd *= 3;
    timeStamp[3] = 0;
    show_debug_message("reload_end");
}


//if player is moving and hits the dodge button, set state to dodge
if(state[s_ACTIVE] == state[s_MOVE] && Input[DODGE])
{

    state[s_ACTIVE] = state[s_DODGE];
    timeStamp_stamina = current_time + 2500;
    alarm[0] = 5;
} 

//stop player from doing anything if they run out of stamina
//if (stamina < 0)
//{ state[s_ACTIVE] = state[s_IDLE]; }


//execute the script stored in the active state
//show_debug_message(state[s_ACTIVE]);
script_execute(state[s_ACTIVE]);


//kill object if hp runs out
if (healthPoints <= 0)
{
    instance_destroy();
}


//restore stamina if doing nothing
if ((state[s_ACTIVE] == state[s_IDLE] || state[s_ACTIVE] == state[s_MOVE]) && current_time >= timeStamp_stamina)
{
    if (stamina < 100)
    {
        stamina += .5;
    }
    else if (stamina > 100)
    { stamina = 100; }
}

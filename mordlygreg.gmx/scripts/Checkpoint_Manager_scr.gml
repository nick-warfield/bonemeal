playerRef = argument[0];


if (global.checkpoint == 1)
{
    room_goto(Laceys_Room);
    rmx = 505;
    rmy = 1440;
}
else if (global.checkpoint == 2)
{
    room_goto(Start_Flr2_rm);
    rmx = 764;
    rmy = 172;
}

audio_stop_all();

with (playerRef)
{
    x = rmx;
    y = rmy;
    healthPoints = hpMax;
    
    script_execute(Gun_Init_scr);
    rot = 0;
    newRot = 0;
    lerpI = 1;
    
    spd = 0;
    
    script_execute(Timing_Init_scr);
    
    ds_stack_clear(StateStack);
    ds_stack_push(StateStack, s_MOVE);
}


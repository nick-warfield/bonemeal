playerRef = argument[0];
audio_stop_all();


if (global.checkpoint == 1)
{
    room_goto(Outside_rm);
    rmx = 535;
    rmy = 1460;
}
else if (global.checkpoint == 2)
{
    room_goto(Office_rm);
    audio_play_sound(Main_trk, 75, true);
    rmx = 764;
    rmy = 172;
}
else if (global.checkpoint == 3)
{
    room_goto(Pit_04_rm);
    audio_play_sound(Main_trk, 75, true);
    rmx = 248;
    rmy = 432;
}


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


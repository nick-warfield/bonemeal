playerRef = argument[0];
//audio_stop_all();

if (global.checkpoint == 1)
{
    with (Game_Manager_obj)
    {
        state = Trans_State.out;
        trans_dir = Trans_Dir.up;
        target_room = Outside_rm;
        playerx = 535;
        playery = 1460;
    }

    //room_goto(Outside_rm);
    //rmx = 535;
    //rmy = 1460;
}
else if (global.checkpoint == 2)
{
    with (Game_Manager_obj)
    {
        state = Trans_State.out;
        trans_dir = Trans_Dir.up;
        target_room = New_office;
        playerx = 400;
        playery = 424;
    }

    //room_goto(New_office);
    //audio_play_sound(Main_trk, 75, true);
    //rmx = 400;
    //rmy = 424;
}
/*
else if (global.checkpoint == 3)
{
    room_goto(Pit_04_rm);
    audio_play_sound(Main_trk, 75, true);
    rmx = 248;
    rmy = 432;
}
*/

with (playerRef)
{
    //x = rmx;
    //y = rmy;
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


var tempmap = saveData_get_value("EMPTY ON RESPAWN");
ds_map_clear(tempmap);

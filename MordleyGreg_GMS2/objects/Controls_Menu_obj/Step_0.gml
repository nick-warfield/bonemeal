script_execute(Inherit_scr,0,0,0,0,0);
///Menu Selection Code

if (timeStamp3 = 0)
{/*
    if (Input[UP])
    {
        selection++;
        
        
        if (audio_is_playing(Reload_snd))
        {audio_stop_sound(Reload_snd);}
        
        var reload2 = audio_play_sound(Reload_snd, 50, false);
        audio_sound_pitch(reload2, 0.7);
        audio_sound_set_track_position(reload2, 0.015);
    }
    
    else if (Input[DOWN])
    {
        selection--;
        
        if (audio_is_playing(Reload_Gun_02_snd))
        {audio_stop_sound(Reload_Gun_02_snd);}
        
        var reload2 = audio_play_sound(Reload_Gun_02_snd, 50, false);
        audio_sound_pitch(reload2, 0.7);
        audio_sound_set_track_position(reload2, 0.015);
    }
    
    
    if (selection != 0) {selection = 0;}
    
    */
    if (Input[INTERACT])
    {
        audio_play_sound(Empty_Gun_snd, 100, false);
        timeStamp3 = current_time + 175;
    }
}
else if (current_time >= timeStamp3)
{
    instance_create(x, y, Start_Menu_obj);
    instance_destroy();
}

/* */
/*  */

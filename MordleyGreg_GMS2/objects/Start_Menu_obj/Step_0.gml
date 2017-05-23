script_execute(Inherit_scr,0,0,0,0,0);
///Menu Selection Code

if (timeStamp3 = 0)
{
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
        
        if (audio_is_playing(Reload_snd))
        {audio_stop_sound(Reload_snd);}
        
        var reload2 = audio_play_sound(Reload_snd, 50, false);
        audio_sound_pitch(reload2, 0.7);
        audio_sound_set_track_position(reload2, 0.015);
    }
    
    
    if (selection > 4) {selection = 0;} else if (selection < 0) {selection = 4;}
    
    
    if (Input[INTERACT])
    {
        audio_play_sound(Gunshot_option01_snd, 100, false);
        timeStamp3 = current_time + 1000;
    }
}
else if (current_time >= timeStamp3)
{
    switch (selection)
    {
      //Start Game
      case 0:
        room_goto_next();
        instance_create(535, 1460, Player02_obj);
        //instance_create(0, 0, Player02_obj);
        
        global.checkpoint = 1;
        global.paused = false;
        break;
        
      //Controls
      case 1:
        instance_create(x, y, Controls_Menu_obj);
        instance_destroy();
        break;
        
      //Options
      case 2:
        //Input[INTERACT] = false;
        instance_create(x, y, Options_Menu_obj);
        instance_destroy();
        break;
        
      //Credits
      case 3:
        instance_create(x, y, Credits_obj);
        instance_destroy();
        break;
        
      //Exit
      case 4:
        game_end();
        break;
    }
    
    timeStamp3 = 0;
}


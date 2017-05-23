script_execute(Inherit_scr,0,0,0,0,0);
///Left Right Input

    //left command
        if ((gamepad_axis_value(0, gp_axislh) <= -0.75 && current_time >= timeStamp1) ||
            (gamepad_axis_value(0, gp_axisrh) <= -0.75 && current_time >= timeStamp1))
        {
            timeStamp1 = current_time + 200;
            timeStamp2 = 0;

            Input[LEFT] = true;
        }
        else if (gamepad_button_check_pressed(0, gp_padl) == true ||
                 keyboard_check_pressed(ord("A")) == true || 
                 keyboard_check_pressed(vk_left) == true)
        {
            Input[LEFT] = true;
        }
        else
        {
            Input[LEFT] = false;
        }
    
    
    //right command
        if ((gamepad_axis_value(0, gp_axislh) >= 0.75 && current_time >= timeStamp2) ||
            (gamepad_axis_value(0, gp_axisrh) >= 0.75 && current_time >= timeStamp2))
        {
            timeStamp2 = current_time + 200;
            timeStamp1 = 0;

            Input[RIGHT] = true;
        }
        else if (gamepad_button_check_pressed(0, gp_padr) == true||
                 keyboard_check_pressed(ord("D")) == true ||
                 keyboard_check_pressed(vk_right) == true)
        {
            Input[RIGHT] = true;
        }
        else
        {
            Input[RIGHT] = false;
        }

        
//audio
if (Input[LEFT] || Input[RIGHT])
{
    if (audio_is_playing(Reload_Gun_02_snd))
    {audio_stop_sound(Reload_Gun_02_snd);}
    
    var reload2 = audio_play_sound(Reload_Gun_02_snd, 50, false);
    audio_sound_pitch(reload2, 0.7);
    audio_sound_set_track_position(reload2, 0.015);
}

///Menu Selection Code
if (timeStamp3 = 0)
{
    switch (selection)
    {
      //GUI Scale
      case 0.1:
        //is actually up...
        if ((Input[DOWN] || Input[RIGHT]) && global.scaleFactor < 5) {global.scaleFactor += 0.05;}
        //is actually down...
        else if (Input[UP] || Input[LEFT] && global.scaleFactor > 0.05) {global.scaleFactor -= 0.05;}
        break;
        
      //volume
      case 1.1:
        var gains = audio_get_master_gain(0);
      
        if (Input[DOWN] || Input[RIGHT] && gains < 1) {gains += 0.05;}
        else if (Input[UP] || Input[LEFT] && gains > 0) {gains -= 0.05;}
        
        audio_set_master_gain(0, gains);
        break;
    
      //No Damage
      case 3.1:
      case 3.2:
        break;
        
      //Keys
      case 4.1:
        if (Input[RIGHT]) {selection = 4.2;}
        else if (Input[DOWN])
        {
            if (instance_exists(Player02_obj)) {Player02_obj.keys++;}
        }
        else if (Input[UP])
        {
            if (instance_exists(Player02_obj)) {Player02_obj.keys--;}
        }
        
        break;
        
      case 4.2:
        if (Input[LEFT]) {selection = 4.1;}
        else if (Input[DOWN])
        {
            if (instance_exists(Player02_obj)) {Player02_obj.bigKey++;}
        }
        else if (Input[UP])
        {
            if (instance_exists(Player02_obj)) {Player02_obj.bigKey--;}
        }
        
        break;
        
      default:
        if (Input[UP])
        {
            selection++
            
            
            if (audio_is_playing(Reload_Gun_02_snd))
            {audio_stop_sound(Reload_Gun_02_snd);}
            
            var reload2 = audio_play_sound(Reload_Gun_02_snd, 50, false);
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
        
        else if (Input[LEFT] && !leftSide)
        {
            leftSide = true;
            selection -= 4;
            if (selection < 0) {selection = 0;}
            
            if (audio_is_playing(Reload_Gun_02_snd))
            {audio_stop_sound(Reload_Gun_02_snd);}
            
            var reload2 = audio_play_sound(Reload_Gun_02_snd, 50, false);
            audio_sound_pitch(reload2, 0.7);
            audio_sound_set_track_position(reload2, 0.015);
        }
        else if (Input[RIGHT] && leftSide)
        {
            leftSide = false;
            selection += 4;
            
            if (audio_is_playing(Reload_Gun_02_snd))
            {audio_stop_sound(Reload_Gun_02_snd);}
            
            var reload2 = audio_play_sound(Reload_Gun_02_snd, 50, false);
            audio_sound_pitch(reload2, 0.7);
            audio_sound_set_track_position(reload2, 0.015);
        }
        
        if (leftSide)
        {
            if (selection > 2) {selection = 0;}
            else if (selection < 0) {selection = 2;}
        }
        else
        {
            if (selection > 6) {selection = 3;}
            else if (selection < 3) {selection = 6;}
        }
    }
    
    if (Input[INTERACT])
    {
        audio_play_sound(Empty_Gun_snd, 100, false);
        timeStamp3 = current_time + 175;
    }
}
else if (current_time >= timeStamp3)
{
    switch (selection)
    {
      //GUI Scale
      case 0:
        selection = 0.1;
        break;
        
        case 0.1:
          selection = 0;
          break;
        
      //Volume
      case 1:
        selection = 1.1
        break;
        
        case 1.1:
          selection = 1;
          break;
        
      //Back
      case 2:
        room_goto(global.oldRm);
        if(global.paused) {global.paused = false;}
        
        break;
        
      //No Damage
      case 3:
        selection = 3.1;
        break;
        
        case 3.1:
          selection = 3;
          break;
          
        case 3.2:
          selection = 3;
          break;
        
      //Keys
      case 4:
        selection = 4.1;
        break;
        
        case 4.1:
          selection = 4;
          break;
          
        case 4.2:
          selection = 4;
          break;
        
      //Reset Room
      case 5:
        break;
        
      //Main Menu
      case 6:
        room_goto(Start_Menu);
        break;
    }
    
    timeStamp3 = 0;
}


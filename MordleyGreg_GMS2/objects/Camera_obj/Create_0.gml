action_fullscreen(2);
script_execute(Dialogue_Init_scr,0,0,0,0,0);
///Window Resize
window_set_size(1440, 768);

//display_set_gui_size(view_wview[0], view_hview[0]);
display_set_gui_maximise(global.scaleFactor, global.scaleFactor, 0, 0);

//remove cursor
window_set_cursor(cr_none);


messageEnd = 0;

lerpI = 1;
rot = 0;
newRot = 0;

///Initialization for Sound Stuff

//audio_master_gain(0);       //mute sounds, nice when debugging


/*
script_execute(Timing_Init_scr);

State = 0;
playerRef = instance_find(Player02_obj, 1);


timeStamp[2] = current_time + random_range(7000, 21000);
timeStamp[3] = timeStamp[2] - 4000;
timeStamp[4] = timeStamp[2] - random_range(4500, 6500);
timeStamp[5] = timeStamp[4];

audio_sound_gain(Crickets_Ambient_snd, 0.05, 0);
audio_play_sound(Crickets_Ambient_snd, 20, true);

*/


/* */
/*  */

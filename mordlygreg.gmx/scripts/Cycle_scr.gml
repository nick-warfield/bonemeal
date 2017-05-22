cylinderPosition += 1;
if (cylinderPosition >= 6) { cylinderPosition = 0; }
//show_debug_message(cylinderPosition);
//show_debug_message(cylinder[cylinderPosition]);

audio_play_sound(ChamberRotate_snd, 50, false);

newRot -= 60;

var temp = cylinderPosition + 1;
if (temp >= 6) { temp = 0; }

cylinder[temp] = Bullet_obj;
//show_debug_message(temp);


var reload2 = audio_play_sound(Reload_Gun_snd, 50, false);
audio_sound_pitch(reload2, 1.3);


var temp = cylinderPosition + 1;
if (temp >= 6) { temp = 0; }

if (temp != 4)
{ cylinder[temp] = Bullet_obj; }
else
{ cylinder[temp] = Bullet_90_obj; }

//show_debug_message(temp);


audio_play_sound(Reload_Gun_02_snd, 50, false);



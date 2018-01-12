var temp = cylinderPosition;
if (temp >= 6) { temp = 0; }

if (temp == 4)
{ cylinder[temp] = Bullet_90_obj; }
else if (temp == 3)
{ cylinder[temp] = SpreadShot02_obj; }
else if (temp = 0)
{ cylinder[temp] = SpreadShot_obj; }
//else if (temp = 2)
//{ cylinder[temp] = Zapper_obj; }
//{ cylinder[temp] = GhostBullet_obj; }
else
{ cylinder[temp] = Bullet_obj; }

//show_debug_message(temp);


audio_play_sound(Reload_snd, 50, false);



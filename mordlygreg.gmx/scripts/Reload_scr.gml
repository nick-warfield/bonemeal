var temp = cylinderPosition + 1;
if (temp >= 6) { temp = 0; }

cylinder[temp] = Bullet_obj;
show_debug_message(temp);

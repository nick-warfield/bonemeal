event_inherited();

var d1 = instance_find(Floor2_Door_obj, 0);
//var d2 = instance_find(Floor2_Door_obj, 0);

with (d1) {instance_destroy();}
//with (d2) {instance_destroy();}

audio_stop_sound(Boss2_trk);


//movement update

//debug speed
if (keyboard_check_pressed(ord('0')))
{
    if (debug == false) { debug = true; }
    else {debug = false;}
}

if (debug && object_index == Player02_obj) {spd = 13;}

if (global.paused) {motion_set(Dir, 0); exit;}

motion_set(Dir, spd);

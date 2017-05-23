///Pause Check

if (global.paused) {exit;}

if (count == 0)
{
    if (red.order == 2 && blue.order == 4 && orange.order == 3 && white.order == 1)
    {
        solved = true;
        newPosition = (y-(40));
        count--;
        show_debug_message("SOLVED");
        
        audio_play_sound(Open_Shrine_02_snd, 50, false);
        
        var txt = instance_find(Shrine_Txt_obj, 1);
        with (txt) {instance_destroy();} 
    }
    else
    {
        red.order = 0;
        blue.order = 0;
        orange.order = 0;
        white.order = 0;
        
        count = countMax;
        show_debug_message("WRONG");
    }
}

if (solved == true)
{
    move_towards_point(x, newPosition, 0.5);
    
    with(red) {move_towards_point(x, door.newPosition, 0.5);}
    with(blue) {move_towards_point(x, door.newPosition, 0.5);}
    with(white) {move_towards_point(x, door.newPosition, 0.5);}
    with(orange) {move_towards_point(x, door.newPosition, 0.5);}
    
    if (y <= newPosition) 
    {
        solved = false; 
        
        speed = 0;
        red.speed = 0;
        blue.speed = 0;
        white.speed = 0;
        orange.speed = 0;
        
        audio_stop_sound(Open_Shrine_02_snd);
    }
}


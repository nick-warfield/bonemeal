//REQUIRES:
//initialization_scr

    //up command
        if (gamepad_axis_value(0, gp_axislv) <= -0.5 ||
            gamepad_button_check(0, gp_padu) == true ||
            keyboard_check(ord('W')) == true || 
            keyboard_check(vk_up) == true)
        {
            Input[UP] = true;
        }
        else
        {
            Input[UP] = false;
        }
    
    
    //down command
        if (gamepad_axis_value(0, gp_axislv) >= 0.5 ||
            gamepad_button_check(0, gp_padd) == true||
            keyboard_check(ord('S')) == true ||
            keyboard_check(vk_down) == true)
        {
            Input[DOWN] = true;
        }
        else
        {
            Input[DOWN] = false;
        }
    
    
    //left command
        if (gamepad_axis_value(0, gp_axislh) <= -0.5 ||
            gamepad_button_check(0, gp_padl) == true ||
            keyboard_check(ord('A')) == true ||
            keyboard_check(vk_left) == true)
        {
            Input[LEFT] = true;
        }
        else
        {
            Input[LEFT] = false;
        }
    
    
    //right command
        if (gamepad_axis_value(0, gp_axislh) >= 0.5 ||
            gamepad_button_check(0, gp_padr) == true||
            keyboard_check(ord('D')) == true ||
            keyboard_check(vk_right) == true)
        {
            Input[RIGHT] = true;
        }
        else
        {
            Input[RIGHT] = false;
        }
    
        
    //interact command
        if (gamepad_button_check_pressed(0, gp_face1) == true ||
            keyboard_check_pressed(ord('E')) == true)
        {
            Input[INTERACT] = true;
        }
        else
        {
            Input[INTERACT] = false;
        }
        
    //reload command
        if (gamepad_button_check_pressed(0, gp_shoulderr) == true ||
            keyboard_check_pressed(ord('R')) == true ||
            mouse_check_button_pressed(mb_middle) == true ||
            mouse_wheel_up() == true)
        {
            Input[ATTACK4] = true;
        }
        else
        {
            Input[ATTACK4] = false;
        }
    
    //cycle cylinder command
        if (gamepad_button_check_pressed(0, gp_shoulderl) == true ||
            gamepad_button_check_pressed(0, gp_face4) == true ||
            keyboard_check_pressed(ord('Q')) == true ||
            (mouse_wheel_down() == true && lerpI >= 0.65))
        {
            Input[ATTACK5] = true;
        }
        else
        {
            Input[ATTACK5] = false;
        }
        
    
    //dodge command
        if (gamepad_button_check_pressed(0, gp_face2) == true ||
            keyboard_check_pressed(vk_lshift) == true)
        {
            Input[DODGE] = true;
        }
        else
        {
            Input[DODGE] = false;
        }
    
    
    //aim gun command
        if (gamepad_button_check(0, gp_shoulderlb) == true ||
            //mouse_check_button(mb_right) == true ||
            keyboard_check(vk_space) == true)
        {
            Input[ATTACK3] = true;
        }
        else
        {
            Input[ATTACK3] = false;
        }
    
    
    //fire gun command
        if (gamepad_button_check_pressed(0, gp_shoulderrb) == true ||
            mouse_check_button_pressed(mb_right) == true ||
            mouse_check_button_pressed(mb_left) == true)
            //keyboard_check(vk_space) == true)
        {
            Input[ATTACK2] = true;
        }
        else
        {
            Input[ATTACK2] = false;
        }
    
        
    //swing umbrella commmand
        if (gamepad_button_check_pressed(0, gp_face3) ||
            //keyboard_check_pressed(vk_space) == true)
            mouse_check_button(mb_left) == true ||
            mouse_check_button(mb_right) == true)
        {
            Input[ATTACK1] = true;
        }
        else
        {
            Input[ATTACK1] = false;
        }

        
    //Pause
        if (gamepad_button_check_pressed(0, gp_start) ||
            keyboard_check_pressed(ord('P')) ||
            keyboard_check_pressed(vk_escape))
        {
            global.paused = !global.paused;
            if (global.paused && room != Options_rm)
            {
                oldRm = room;
                global.pauseBkg = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0); 
                room_goto(Options_rm);
            }
            else
            { room_goto(oldRm); }
        }
  
   
/*
    //parry umbrella command
        if (gamepad_button_check(0, gp_start) ||
            keyboard_check(ord('Q')))
        {
            Input[PARRY] = true;
        }
        else
        {
            Input[PARRY] = false;
        }

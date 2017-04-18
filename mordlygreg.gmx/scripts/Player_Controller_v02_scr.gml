//REQUIRES:
//initialization_scr

    //up command
        if (gamepad_axis_value(0, gp_axislv) <= -0.5 ||
            gamepad_axis_value(0, gp_axisrv) <= -0.5 ||
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
            gamepad_axis_value(0, gp_axisrv) >= 0.5 ||
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
            gamepad_axis_value(0, gp_axisrh) <= -0.5 ||
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
            gamepad_axis_value(0, gp_axisrh) >= 0.5 ||
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
        if (gamepad_button_check_pressed(0, gp_face3) == true ||
            keyboard_check_pressed(ord('R')) == true)
        {
            Input[ATTACK4] = true;
        }
        else
        {
            Input[ATTACK4] = false;
        }
    
    //cycle cylinder command
        if (gamepad_button_check_pressed(0, gp_face4) == true ||
            keyboard_check_pressed(ord('T')) == true)
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
        if (gamepad_button_check(0, gp_shoulderl) == true ||
            gamepad_button_check(0, gp_shoulderlb) == true ||
            mouse_check_button(mb_right) == true ||
            keyboard_check(vk_rshift) == true)
        {
            Input[ATTACK3] = true;
        }
        else
        {
            Input[ATTACK3] = false;
        }
    
    
    //fire gun command
        if (gamepad_button_check_pressed(0, gp_shoulderr) == true ||
            gamepad_button_check_pressed(0, gp_shoulderrb) == true ||
            mouse_check_button_pressed(mb_left) == true ||
            keyboard_check(vk_space) == true)
        {
            Input[ATTACK2] = true;
        }
        else
        {
            Input[ATTACK2] = false;
        }
    
        
/*        
        if (gamepad_button_check(0, gp_shoulderr) == true ||
            gamepad_button_check(0, gp_shoulderrb) == true ||
            keyboard_check(vk_space) == true)
        {
            num++;
            if (num > 9) 
            {
                Input[PARRY] = true;
                //show_debug_message("Parry");
            }
        }
        else
        {
            if (Input[PARRY] == false && num != 0)
            {
                Input[ATTACK1] = true;
                num = 0;
                //show_debug_message("SWING");
            }
            else
            {
                Input[ATTACK1] = false;
                Input[PARRY] = false;
                num = 0;
            }
        }
        
*/    
    //swing umbrella commmand
        if (gamepad_button_check_pressed(0, gp_shoulderr) == true ||
            gamepad_button_check_pressed(0, gp_shoulderrb) == true ||
            keyboard_check_pressed(vk_space) == true)
        {
            Input[ATTACK1] = true;
        }
        else
        {
            Input[ATTACK1] = false;
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

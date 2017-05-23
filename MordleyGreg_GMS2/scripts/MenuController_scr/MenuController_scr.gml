///up and down input

    //down command
        if ((gamepad_axis_value(0, gp_axislv) <= -0.75 && current_time >= timeStamp1) ||
            (gamepad_axis_value(0, gp_axisrv) <= -0.75 && current_time >= timeStamp1))
        {
            if (count < 3)
            {
                timeStamp1 = current_time + 200;
                timeStamp2 = 0;
                count++;
            }
            else
            {
                timeStamp1 = current_time + 50;
            }
            Input[DOWN] = true;
        }
        else if (gamepad_button_check_pressed(0, gp_padu) == true ||
                 keyboard_check_pressed(ord("W")) == true || 
                 keyboard_check_pressed(vk_up) == true)
        {
            Input[DOWN] = true;
        }
        else
        {
            Input[DOWN] = false;
        }
    
    
    //up command
        if ((gamepad_axis_value(0, gp_axislv) >= 0.75 && current_time >= timeStamp2) ||
            (gamepad_axis_value(0, gp_axisrv) >= 0.75 && current_time >= timeStamp2))
        {
            if (count < 3)
            {
                timeStamp2 = current_time + 200;
                timeStamp1 = 1;
                count++;
            }
            else
            {
                timeStamp2 = current_time + 50;
            }
            Input[UP] = true;
        }
        else if (gamepad_button_check_pressed(0, gp_padd) == true||
                 keyboard_check_pressed(ord("S")) == true ||
                 keyboard_check_pressed(vk_down) == true)
        {
            Input[UP] = true;
        }
        else
        {
            Input[UP] = false;
        }
        
    //counter reset
    if (gamepad_axis_value(0, gp_axislv) > -0.75 &&
        gamepad_axis_value(0, gp_axislv) < 0.75  &&
        gamepad_axis_value(0, gp_axisrv) > -0.75 &&
        gamepad_axis_value(0, gp_axisrv) < 0.75)
    {count = 0;}
        
        
    //interact command
        if (gamepad_button_check_pressed(0, gp_face1) == true ||
            gamepad_button_check_pressed(0, gp_start) == true ||
            keyboard_check_pressed(ord("E")) == true ||
            keyboard_check_pressed(vk_space) == true ||
            keyboard_check_pressed(vk_enter) == true)
        {
            Input[INTERACT] = true;
        }
        else
        {
            Input[INTERACT] = false;
        }

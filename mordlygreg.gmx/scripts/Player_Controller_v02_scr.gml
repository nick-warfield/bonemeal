//REQUIRES:
//initialization_scr
    
    //up command
        if (gamepad_axis_value(0, gp_axislv) <= -0.5 ||
            gamepad_axis_value(0, gp_axisrv) <= -0.5 ||
            gamepad_button_check(0, gp_padu) == true)
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
            gamepad_button_check(0, gp_padd) == true)
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
            gamepad_button_check(0, gp_padl) == true)
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
            gamepad_button_check(0, gp_padr) == true)
        {
            Input[RIGHT] = true;
        }
        else
        {
            Input[RIGHT] = false;
        }
    
        
    //interact command
        if (gamepad_button_check_pressed(0, gp_face1) == true)
        {
            Input[INTERACT] = true;
        }
        else
        {
            Input[INTERACT] = false;
        }
        
    //reload command
        if (gamepad_button_check_pressed(0, gp_face3) == true)
        {
            Input[ATTACK4] = true;
            InputID = ATTACK4;
        }
        else
        {
            Input[ATTACK4] = false;
        }
    
    //cycle cylinder command
        if (gamepad_button_check_pressed(0, gp_face4) == true)
        {
            Input[ATTACK5] = true;
        }
        else
        {
            Input[ATTACK5] = false;
        }
        
    
    //dodge command
        if (gamepad_button_check_pressed(0, gp_face2) == true)
        {
            Input[DODGE] = true;
        }
        else
        {
            Input[DODGE] = false;
        }
    
    
    //aim gun command
        if (gamepad_button_check(0, gp_shoulderl) == true ||
            gamepad_button_check(0, gp_shoulderlb) == true)
        {
            Input[ATTACK3] = true;
        }
        else
        {
            Input[ATTACK3] = false;
        }
    
    
    //fire gun command
        if (gamepad_button_check_pressed(0, gp_shoulderr) == true ||
            gamepad_button_check_pressed(0, gp_shoulderrb) == true)
        {
            Input[ATTACK2] = true;
        }
        else
        {
            Input[ATTACK2] = false;
        }
    
    
    //swing umbrella commmand
        if (gamepad_button_check_pressed(0, gp_shoulderr) == true ||
            gamepad_button_check_pressed(0, gp_shoulderrb) == true)
        {
            Input[ATTACK1] = true;
        }
        else
        {
            Input[ATTACK1] = false;
        }

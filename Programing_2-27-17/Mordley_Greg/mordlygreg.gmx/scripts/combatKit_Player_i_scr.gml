//combatKit for player

//weapon jazz

    //weapon cycle
    if (cycleInput == true)
    {
        if (usingGun == true) 
        { usingGun = false; }
        else 
        { usingGun = true; }
        
        show_debug_message("swapped weapons");
    }
    
    //use selected weapon
    if (usingGun == false)
    {
        //weapon swing
        if (attackInput[0] == true)
        {
            show_debug_message("swing");
            
            
        }
    }   
    else
    {  
        //gun aim
        if (attackInput[2] == true)
        {
            aimingGun = true;
            show_debug_message("aiming");
            
            bulletInst = instance_create(player_obj.x, player_obj.y, bullet_obj);
            with(bulletInst)
            {
                image_angle = player_obj.direction;
            }
        }
        
        //fire gun
        if (attackInput[1] == true)
        {
            
            aimingGun = false;
            show_debug_message("fire!");
            
            with(bulletInst)
            {
                speed = 30;
                image_angle = player_obj.direction;
                direction = player_obj.direction;
            }
        }
    }


//dodge roll

    if (dodgeInput == true && (upInput == true || downInput == true || leftInput == true || rightInput == true))
    {
        aimingGun = false;
        show_debug_message("dodge roll");

        if (instance_exists(bulletInst) == true)
        { 
            with(bulletInst)
            {
                bulletInst = instance_destroy();
            }
        }
        
        
        spd *= 3;
        rolling = true;

    }

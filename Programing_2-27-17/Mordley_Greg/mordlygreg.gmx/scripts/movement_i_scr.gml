//player movement and controls

//movemnt jazz
    if (rolling == false)
    {
        //y axis movement
        if (Input[UP] == true)
        {
            ySpeed = -1;
            facing = 90;
        }
        
        if (Input[DOWN] == true)
        {
            ySpeed = 1;
            facing = 270;
        }
        
        if (Input[UP] == false && Input[DOWN] == false)
        {
            ySpeed = 0;
        }
        
        
        //x axis movement
        if (Input[LEFT] == true)
        {
            xSpeed = -1;
            facing = 180;
        }
        
        if (Input[RIGHT] == true)
        {
            xSpeed = 1;
            facing = 0;
        }
        
        if (Input[RIGHT] == false && Input[LEFT] == false)
        {
            xSpeed = 0;
        }
        
        
        direction = facing;
    }
    
    //number cruncher to actually move object
    if (aimingGun == false)
    {
        hspeed = xSpeed * spd;
        vspeed = ySpeed * spd;
    }
    else
    {
        hspeed = 0;
        vspeed = 0;
    }


//interact with stuff
    if (Input[INTERACT] == true)
    {
        show_debug_message("talking");
    }

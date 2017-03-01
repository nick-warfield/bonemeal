//variable initialization
      
    //state array
        state[s_ACTIVE] = Idle_scr;
        state[s_IDLE] = Idle_scr;
        state[s_MOVE] = Move_Defualt_scr;
        state[s_DODGE] = Dodge_scr;
        state[s_INTERACT] = Interact_scr;
        state[BLOCK] = Block_scr;
        state[PARRY] = Parry_scr;
        state[s_ATTACK1] = UmbrellaSwing_scr;
        state[s_ATTACK2] = FireGun_scr;
        state[s_ATTACK3] = AimGun_scr;
        state[s_ATTACK4] = 0;
        state[s_ATTACK5] = 0;
        state[s_DAMAGED] = TookDamage_scr;
        
    //Resource related variables
        healthPoints = 10;
        stamina = 100;
        damage = 1;
        knockBack = 0;

        
    //timing and cooldowns
        timeStamp[0] = 0;
        timeStamp[1] = 1;

    //movement variables
        usingGun = false;       //bools
        aimingGun = false;
        rolling = false;
        xSpeed = 0;             //movement vectors
        ySpeed = 0;
        spd = 5;        //general speed multiplier
        facing = RIGHT;
        bulletInst = Bullet_obj;

            
    //initialize input bools for controllers
        //j = total number of inputs, 10 by default
        //0-3 up, down, left right
        //4 interact
        //5 dodge
        //6 block
        //7 parry
        //8-12 attacks
        var j = 12;
        for (var i = 0; i < j; i = i + 1)
        {
            Input[i] = false;
        }
        
        
        //used for switching state based on input
        InputID = 0;
        
        //LastState can be used so one state can require another state before it
        LastState = "NULL";

        
/*
notes for all variables that do not get initialized



*/

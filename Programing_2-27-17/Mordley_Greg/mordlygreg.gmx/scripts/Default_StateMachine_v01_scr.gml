//REQUIRES:
//initialization_scr

//State Machine
    //show_debug_message(InputID); 

    switch(InputID)
    {
        case(UP):
        case(DOWN):
        case(RIGHT):
        case(LEFT):
            state[s_ACTIVE] = state[s_MOVE]
            LastState = "MOVE";
            break;
            
        case(INTERACT):
            state[s_ACTIVE] = state[s_INTERACT];
            LastState = "INTERACT";
            break;
            
        case(DODGE):
            switch(LastState)
            {
                //can't dodge if player is idle or swinging umbrella
                case("IDLE"):
                case("ATTACK1"):
                    break;
            
                default:
                    state[s_ACTIVE] = state[s_DODGE];
                    LastState = "DODGE";
                    break;
            }
            break;
        
        //umbrella swing    
        case(ATTACK1):
            state[s_ACTIVE] = state[s_ATTACK1];
            LastState = "ATTACK1";
            break;
            
        //fire gun
        case(ATTACK2):
            if (LastState == "ATTACK3")
            {
                state[s_ACTIVE] = state[s_ATTACK2];
                LastState = "ATTACK2";
            }
            break;
        
        //aim gun
        case(ATTACK3):
            state[s_ACTIVE] = state[s_ATTACK3]
            LastState = "ATTACK3";
            break;
        
        default:
            state[s_ACTIVE] = state[s_IDLE];
            LastState = "IDLE";
            break;
    }
    
    //if (LastState != "IDLE") { show_debug_message(LastState); }
    script_execute(state[s_ACTIVE]);  
        


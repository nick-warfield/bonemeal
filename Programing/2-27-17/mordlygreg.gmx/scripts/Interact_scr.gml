//interact with stuff
    if (Input[INTERACT] == true)
    {
        show_debug_message("talking");
        
        // Within each IF, place the interactions possible (Notes, Doors, NPCs, Items, Etc.)
        if (place_meeting(x,y+3, Player02_obj) && facing == UP) //checks collision to players UP at a distance of 3 pixels
            {
                                        //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (place_meeting(x,y-3, Player02_obj) && facing == DOWN) //checks collision to players DOWN at a distance of 3 pixels
            {
                                       //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (place_meeting(x+3,y, Player02_obj) && facing == RIGHT) //checks collision to players RIGHT at a distance of 3 pixels
            {
                                        //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (place_meeting(x-3,y, Player02_obj) && facing == LEFT) //checks collision to players LEFT at a distance of 3 pixels
            {
                                        //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
    }

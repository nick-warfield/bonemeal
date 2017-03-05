//interact with stuff
var xdir = lengthdir_x(8, facing);
var ydir = lengthdir_y(8, facing);
var Speaker = instance_place(x+xdir, y+ydir, Speaker_obj);

 /*   if(Speaker != noone)    
        {
        //Talk to it
        with (Speaker)
        {
            if (!instance_exists(Dialogue))
                {
                Dialogue = instance_create(x+xoffset, y+yoffset, Dialogue_obj);
                Dialogue.text = text;
                } else {Dialogue.text_page++;
                        Dialogue.text_count = 0;
                        if (Dialogue.text_page > array_length_1d(Dialogue.text)-1)
                            {
                            with (Dialogue)
                                {
                                instance_destroy();
                                }
                            }
                        }
            }
            }*/

        
  
  
    if (Input[INTERACT] == true)
    {
        show_debug_message("talking");
        
        // Within each IF, place the interactions possible (Notes, Doors, NPCs, Items, Etc.)
        if (instance_place(x+xdir, y+ydir, Speaker_obj)) //checks collision to players UP at a distance of 3 pixels
            {
             if (!instance_exists(Dialogue))
                {
                Dialogue = instance_create(x+xoffset, y+yoffset, Dialogue_obj);
                Dialogue.text = text;
                } else {Dialogue.text_page++;
                        Dialogue.text_count = 0;
                        if (Dialogue.text_page > array_length_1d(Dialogue.text)-1)
                            {
                            with (Dialogue)
                                {
                                instance_destroy();
                                }
                            }
                        }                           //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (instance_place(x+xdir, y+ydir, OBJECT)) //checks collision to players DOWN at a distance of 3 pixels
            {
                                       //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (instance_place(x+xdir, y+ydir, OBJECT)) //checks collision to players RIGHT at a distance of 3 pixels
            {
                                        //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
        if (instance_place(x+xdir, y+ydir, OBJECT)) //checks collision to players LEFT at a distance of 3 pixels
            {
                                        //interact with the object/NPC (possibly within an IF to seperate different objects)
            }
            
    }

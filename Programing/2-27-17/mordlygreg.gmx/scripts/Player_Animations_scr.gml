///Player_Animations_scr

//UP ANIMATION
if(Input[UP] = true)
        {
        Player02_obj.sprite_index = Player_Up_spr;
        image_speed = .2;
        }
if (Input[UP] = false && sprite_index = Player_Up_spr)
                {
                image_index = 0;
                }   
                     
// DOWN ANIMATION
if(Input[DOWN] = true)
        {
        Player02_obj.sprite_index = Player_Down_spr;
        image_speed = .2;
        }
if (Input[DOWN] = false && sprite_index = Player_Down_spr)
                {
                image_index = 0;
                }
                
// LEFT ANIMATION         
if(Input[LEFT] = true)
        {
        Player02_obj.sprite_index = Player_Left_spr;
        image_speed = .2;
        } 
if (Input[LEFT] = false && sprite_index = Player_Left_spr)
                {
                image_index = 0;
                }
// RIGHT ANIMATION            
if(Input[RIGHT] = true)
        {
        Player02_obj.sprite_index = Player_Right_spr;
        image_speed = .2;
        }
if (Input[RIGHT] = false && sprite_index = Player_Right_spr)
                {
                image_index = 0;
                }

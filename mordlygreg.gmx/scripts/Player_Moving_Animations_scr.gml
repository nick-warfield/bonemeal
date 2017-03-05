///Player_Moving_Animations_scr

switch (vspeed)
    {
    //MOVING UP
    case (-5):
    Player02_obj.sprite_index = Player_Up_spr;
    image_speed = .2;
    break;
    
    //MOVING DOWN
    case (5):
    Player02_obj.sprite_index = Player_Down_spr;
    image_speed = .2;
    break;
    }
switch (hspeed)
    {
    //MOVING LEFT
    case (-5):
    Player02_obj.sprite_index = Player_Left_spr;
    image_speed = .2;
    break;
    
    //MOVING RIGHT
    case (5):
    Player02_obj.sprite_index = Player_Right_spr;
    image_speed = .2;
    break;
    } 


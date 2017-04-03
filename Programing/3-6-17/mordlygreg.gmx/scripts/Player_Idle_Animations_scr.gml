///Player_Idle_Animations_scr
switch (facing)
    {
  //_Idle
    //UP
    case 90:
    Player02_obj.sprite_index = Player_Up_spr;
    image_index = 0;
    break;
    //DOWN
    case 270:
    Player02_obj.sprite_index = Player_Down_spr;
    image_index = 0;
    break;
    //LEFT
    case 180:
    Player02_obj.sprite_index = Player_Left_spr;
    image_index = 0;
    break;
    //RIGHT
    case 0:
    Player02_obj.sprite_index = Player_Right_spr;
    image_index = 0;
    break;
    
    }

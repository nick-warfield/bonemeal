if (place_meeting(x, y, Small_obj) || place_meeting(x, y, Player02_obj))
{
    active = true;
    sprite_index = Plate_Pressed_spr;
}
else 
{
    active = false;
    sprite_index = Plate_Unpressed_spr;
}


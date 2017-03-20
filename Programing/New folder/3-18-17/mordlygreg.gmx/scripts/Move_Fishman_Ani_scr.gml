if (Dir >= 45 && Dir < 135)
{
    sprite_index = Fishman_Walk_Back_spr;
    image_xscale = 1;
}
else if (Dir >= 135 && Dir < 225)
{
    sprite_index = Fishman_Walk_Side_spr;
    image_xscale = -1;
}
else if (Dir >= 225 && Dir < 315)
{
    sprite_index = Fishman_Walk_Front_spr;
    image_xscale = 1;
}
else
{
    sprite_index = Fishman_Walk_Side_spr;
    image_xscale = 1;
}

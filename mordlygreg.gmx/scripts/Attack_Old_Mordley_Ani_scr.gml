//image_speed = 2/60;

if (facing == RIGHT)
{
    sprite_index = Mordley_Old_Attk_Side_spr;
    image_xscale = 1;
}
else if (facing == LEFT)
{
    sprite_index = Mordley_Old_Attk_Side_spr;
    image_xscale = -1;
}
else if (facing == UP)
{
    sprite_index = Mordley_Old_Attk_Back_spr;
    image_xscale = 1;
}
else if (facing == DOWN)
{
    sprite_index = Mordley_Old_Attk_Front_spr;
    image_xscale = 1;
}

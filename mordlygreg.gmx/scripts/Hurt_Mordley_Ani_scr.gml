///Hurt_Mordley_Ani_scr(Side, Back, Front)

if (facing == RIGHT)
{
    sprite_index = argument0;
    image_xscale = 1;
}
else if (facing == LEFT)
{
    sprite_index = argument0;
    image_xscale = -1;
}
else if (facing == UP)
{
    sprite_index = argument1;
    image_xscale = 1;
}
else if (facing == DOWN)
{
    sprite_index = argument2;
    image_xscale = 1;
}

if (Dir == 270 || facing == DOWN)
{
    sprite_index = Mordley_Walk_Down_spr;
    image_xscale = 1;
    facing = DOWN;
}
if (Dir == 0 || facing == RIGHT)
{
    sprite_index = Mordley_Walk_Side_spr;
    image_xscale = 1;
    facing = RIGHT;
}
if (Dir == 180 || facing == LEFT)
{
    sprite_index = Mordley_Walk_Side_spr;
    image_xscale = -1;
    facing = LEFT;
}
if (Dir == 90 || facing == UP)
{
    sprite_index = Mordley_Walk_Up_spr;
    image_xscale = 1;
    facing = UP;
}

image_speed = 9/60;

if (Dir == 270 || facing == DOWN)
{
    if (spd == 0) {sprite_index = Mordley_Front_spr;}
    else {sprite_index = Mordley_Walk_Down_spr;}
    image_xscale = 1;
    facing = DOWN;
}
if (Dir == 0 || facing == RIGHT)
{
    if (spd == 0) {sprite_index = Mordley_Side_spr;}
    else {sprite_index = Mordley_Walk_Side_spr;}
    image_xscale = 1;
    facing = RIGHT;
}
if (Dir == 180 || facing == LEFT)
{
    if (spd == 0) {sprite_index = Mordley_Side_spr;}
    else {sprite_index = Mordley_Walk_Side_spr;}
    image_xscale = -1;
    facing = LEFT;
}
if (Dir == 90 || facing == UP)
{
    if (spd == 0) {sprite_index = Mordley_Back_spr;}
    else {sprite_index = Mordley_Walk_Up_spr;}
    image_xscale = 1;
    facing = UP;
}

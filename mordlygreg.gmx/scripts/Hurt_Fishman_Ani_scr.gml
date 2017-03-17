var tempDir = Dir + 180;
if (tempDir >= 360) {tempDir -= 360;}

if (tempDir >= 45 && tempDir < 135)
{
    sprite_index = Hurt_Back_Fishman_spr;
    image_xscale = 1;
}
else if (tempDir >= 135 && tempDir < 225)
{
    sprite_index = Hurt_Side_Fishman_spr;
    image_xscale = -1;
}
else if (tempDir >= 225 && tempDir < 315)
{
    sprite_index = Hurt_Front_Fishman_spr;
    image_xscale = 1;
}
else
{
    sprite_index = Hurt_Side_Fishman_spr;
    image_xscale = 1;
}

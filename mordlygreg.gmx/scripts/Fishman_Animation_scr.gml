if (vspeed < 0)
{
    id.image_index = Fishman_Walk_Side_spr;
    image_speed = 60;
}
else if (vspeed > 0)
{
    id.image_index = Fishman_Walk_Front_spr;
    image_xscale = 1;
    image_speed = 60;
}
else if (hspeed < 0)
{
    id.image_index = Fishman_Walk_Side_spr;
    image_xscale = -1;
    image_speed = 60;
}
else if (hspeed > 0)
{
    id.image_index = Fishman_Walk_Side_spr;
    image_xscale = 1;
    image_speed = 60;
}
else
{
    id.image_index = Fishman_Idle_spr;
    image_xscale = 1;
    image_speed = 60;
}


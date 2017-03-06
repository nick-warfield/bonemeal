//swing code here

f = instance_create(x, y, SwingArc_obj);
f.spawner = id;

with (f)
{
    direction = spawner.direction;
    if (direction == 0)
    {
        x = spawner.x + 32;
    }
    else if (direction == 180)
    {
        x = spawner.x - 32;
    }
    else if (direction == 90)
    {
        y = spawner.y - 48;
    }
    else if (direction == 270)
    {
        y = spawner.y + 48;
    }
    
    damage = 1;
}

if (direction == 0)
{
    sprite_index = Mordley_Attk_Side_spr
    image_xscale = 1;
}
else if (direction == 180)
{
    sprite_index = Mordley_Attk_Side_spr
    image_xscale = -1;
}
else if (direction == 90)
{
    sprite_index = Mordley_Attk_Back_spr
    image_xscale = 1;
}
else if (direction == 270)
{
    sprite_index = Mordley_Attk_Front_spr
    image_xscale = 1;
}


stamina -= 10;

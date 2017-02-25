//swing code here

f = instance_create(x, y, SwingArc_obj);
f.direction = id.direction;
if (f.direction == 0)
{ f.x = x + 32; }
else if (f.direction == 180)
{ f.x = x - 32; }
else if (f.direction == 90)
{ f.y = y - 48; }
else if (f.direction == 270)
{ f.y = y + 48; }

f.damage = 1;
f.spawner = id;

show_debug_message("swing");



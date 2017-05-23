for (var i = 0; i < instance_number(Character_obj); i++)
{
    thing[i] = instance_find(Character_obj, i);
    thing[i].spd *= 10;
}

for (var i = 0; i < instance_number(Projectile_obj); i++)
{
    thing02[i] = instance_find(Projectile_obj, i);
    if (thing02[i].spawner != id.spawner)
    { thing02[i].speed *= 10; }
}


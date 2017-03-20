damage = 3;
knockback = 25;
spd = 10;

timeStamp_SlowMo = current_time + 1000;


//this pattern will only slow things that have already been made
//putting this in a step event will just make everything freeze in place forever
//also need to add some particle effects, else this just looks lackluster
for (var i = 0; i < instance_number(Character_obj); i++)
{
    thing[i] = instance_find(Character_obj, i);
    thing[i].spd /= 10;
}

for (var i = 0; i < instance_number(Projectile_obj); i++)
{
    thing02[i] = instance_find(Projectile_obj, i);
    if (thing02[i].spawner != id.spawner)
    { thing02[i].speed /= 10; }
}

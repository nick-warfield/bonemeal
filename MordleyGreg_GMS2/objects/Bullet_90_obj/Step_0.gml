if ((place_meeting(x, y, Character_obj) || place_meeting(x, y, Wall_obj)) && !place_meeting(x, y, spawner))
{
    instance_destroy();
}

if (current_time >= timeStamp2)
{
    var bull1 = instance_create(x, y, Bullet_obj);
    bull1.dmg = 2;
    bull1.spd = 10;
    bull1.image_angle = Dir + 90;
    bull1.Dir = Dir + 90;
    bull1.spawner = spawner;
    bull1.timeStamp = current_time + 300;
    bull1.image_blend = c_lime;

    var bull2 = instance_create(x, y, Bullet_obj);
    bull2.dmg = 2;
    bull2.spd = 10;
    bull2.image_angle = Dir - 90;
    bull2.Dir = Dir - 90;
    bull2.spawner = spawner;
    bull2.timeStamp = current_time + 300;
    bull2.image_blend = c_lime;
    
    instance_destroy();
}

script_execute(Movement_Update_scr,0,0,0,0,0);

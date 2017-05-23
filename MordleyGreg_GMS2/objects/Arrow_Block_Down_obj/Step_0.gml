if (current_time >= timeStamp)
{
    timeStamp = current_time + 1500;
    
    var bull = instance_create(x, y, Bullet_obj);
    bull.spawner = id;
    
    bull.Dir = 270;
    bull.image_angle = 270;
    bull.spd = 7;
    
    bull.dmg = 2;
}


if (current_time >= timeStamp)
{
    timeStamp = current_time + 1500;
    
    var bull = instance_create(x, y, Bullet_obj);
    bull.spawner = id;
        
    bull.image_index = Arrow_Left_spr;
    bull.mask_index = Arrow_Left_spr;
    
    bull.Dir = 180;
    bull.image_angle = 180;
    bull.spd = 7;
    
    bull.dmg = 2;
}


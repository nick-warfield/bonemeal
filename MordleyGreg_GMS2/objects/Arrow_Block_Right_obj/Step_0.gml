if (current_time >= timeStamp)
{
    timeStamp = current_time + 1500;
    
    var bull = instance_create(x, y, Bullet_obj);
    bull.spawner = id;
        
    bull.image_index = Arrow_Right_spr;
    bull.mask_index = Arrow_Right_spr;
    
    bull.Dir = 0;
    bull.image_angle = 0;
    bull.spd = 7;
    
    bull.dmg = 2;
}


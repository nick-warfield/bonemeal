if (instance_exists(target))
{
    theDistance = point_distance(x, y, target.x, target.y);
    
    if (theDistance <= (4*32))
    {
        //run state
        var runDirection = point_direction(target.x, target.y, x, y);
        motion_set(runDirection, spd*1.25);
    }
    else
    { speed = 0; }
    
    if (theDistance <= (10*32))
    {
        //spit attack
        if (current_time >= timeStamp[1])
        {
            targetDirection = point_direction(x, y, target.x, target.y);
            spitInst = instance_create(x, y, Bullet_obj);
            
            //set reference to the object that spawns the projectile
            spitInst.spawner = id;
            //initialize the projectiles speed and direction
            spitInst.speed = 5;
            spitInst.image_angle = id.targetDirection;
            spitInst.direction = id.targetDirection;
            
            timeStamp[1] = current_time + random_range(1500, 4000);
        }
    }
}

if (healthPoints <= 0) { instance_destroy(); }

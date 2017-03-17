

if (cylinder[cylinderPosition] != 0)
{
    bulletInst = instance_create(x, y, Bullet_obj);
    
    //set reference to the object that spawns the projectile
    bulletInst.spawner = id;
    //initialize the projectiles speed and direction
    bulletInst.speed = 10;
    bulletInst.image_angle = id.facing * 90;
    bulletInst.direction = id.facing * 90;
    
    //clear the current chamber
    cylinder[cylinderPosition] = 0;
}

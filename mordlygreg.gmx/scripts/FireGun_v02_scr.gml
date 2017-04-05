//gun code here

if (cylinder[cylinderPosition] != 0)
{
    //fire the bullet
    bulletInst = instance_create(x, y, cylinder[cylinderPosition])
    //set reference to the object that spawns the projectile
    bulletInst.spawner = id;
    //initialize the projectiles speed and direction
    bulletInst.speed = 30;
    bulletInst.image_angle = id.direction;
    bulletInst.direction = id.direction;
    
    //clear the current chamber
    cylinder[cylinderPosition] = 0;
}

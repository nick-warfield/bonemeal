//gun code here
show_debug_message("bang");

bulletInst = instance_create(x, y, SlowMo_Bullet_obj);

//set reference to the object that spawns the projectile
bulletInst.spawner = id;
//initialize the projectiles speed and direction
bulletInst.speed = 10;
bulletInst.image_angle = id.direction;
bulletInst.direction = id.direction;


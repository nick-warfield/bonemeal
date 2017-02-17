//gun code here
show_debug_message("bang");

bulletInst = instance_create(x, y, bullet_obj);

//set reference to the object that spawns the projectile
bulletInst.spawner = id;
//initialize the projectiles speed and direction
bulletInst.speed = 30;
bulletInst.image_angle = player2_obj.direction;
bulletInst.direction = player2_obj.direction;


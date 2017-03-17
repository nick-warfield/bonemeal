show_debug_message("bang");

bulletInst = instance_create(x, y, Bullet_obj);

//set reference to the object that spawns the projectile
bulletInst.spawner = id;
//initialize the projectiles speed and direction
bulletInst.speed = 10;
bulletInst.image_angle = id.facing * 90;
bulletInst.direction = id.facing * 90;

audio_play_sound(Shot01_Gun_snd, 50, false);

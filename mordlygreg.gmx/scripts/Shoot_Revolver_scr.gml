//show_debug_message(cylinderPosition);

if (cylinder[cylinderPosition] != 0)
{
    //spawn bullet
    bulletInst = instance_create(x, y, cylinder[cylinderPosition]);
    //show_debug_message(object_get_name(bulletInst.object_index));
    
    //set the direction of the bullet
    if (facing == 0) { bulletInst.y -= 8; bulletInst.x += 32; }
    else if (facing == 2) { bulletInst.y -= 8; bulletInst.x -= 32; }
    else if (facing == 1) { bulletInst.y -= 32; }
    else if (facing == 3) { bulletInst.y += 32; }
    
    //set reference to the object that spawns the projectile
    bulletInst.spawner = id;
    //initialize the projectiles speed and direction
    bulletInst.spd = 10;
    bulletInst.image_angle = id.facing * 90;
    bulletInst.Dir = id.facing * 90;
    
    //clear the current chamber
    cylinder[cylinderPosition] = 0;
    
    //play sound
    audio_play_sound(Gunshot_option01_snd, 50, false);
    
    //screenshake
    shake = 15;
    
    //knockback after shooting
    script_execute(SetDamageVars_scr(bulletInst, 4, 75));
}
else { audio_play_sound(Empty_Gun_snd, 50, false); }

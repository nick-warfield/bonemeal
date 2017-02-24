//run this if you got hit scrub
damage = argument0;
knockback = argument1;


healthPoints -= damage;
//motion_add(-facing, knockback);

show_debug_message(healthPoints);

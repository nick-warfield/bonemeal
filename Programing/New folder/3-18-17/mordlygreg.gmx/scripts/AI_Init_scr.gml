state[s_DAMAGED] = TookDamage_scr;
State = 0;
i = 0;

//AI stuff
    target = instance_find(Player02_obj, 1);
    reset = true;
    runOnce = true;
    hit = false;
    frameCount = 0;
    randDirection = 0;
    oldx = 0;
    oldy = 0;

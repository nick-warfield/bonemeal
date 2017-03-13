State = s_MOVE;


//state array
    state[s_ACTIVE] = Idle_scr;
    state[s_IDLE] = Idle_scr;
    state[s_MOVE] = Move_Bad_scr;
    state[s_DODGE] = Dodge_scr;
    state[s_INTERACT] = Interact_scr;
    state[BLOCK] = Block_scr;
    state[PARRY] = Parry_scr;
    state[s_ATTACK1] = UmbrellaSwing_scr;
    state[s_ATTACK2] = FireGun_scr;
    state[s_ATTACK3] = AimGun_scr;
    state[s_ATTACK4] = Reload_scr;
    state[s_ATTACK5] = 0;
    state[s_DAMAGED] = TookDamage_scr;

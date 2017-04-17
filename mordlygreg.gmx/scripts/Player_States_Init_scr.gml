State = s_MOVE;

StateArray[0] = s_MOVE;
for (var i = 1; i < 5; i++) {StateArray[i] = 0;}

StateStack = ds_stack_create();

keys = 0;
bigKey = 0;

/*
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

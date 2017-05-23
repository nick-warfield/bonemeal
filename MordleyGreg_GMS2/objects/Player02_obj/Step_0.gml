script_execute(Player_Controller_v04_scr,0,0,0,0,0);
script_execute(Mordley_SM_v11_scr,0,0,0,0,0);
script_execute(Var_Collision_scr,0,0,0,0,0);
script_execute(Small_Collision_v08,0,0,0,0,0);
///Wall Collision Mask
mask_index = Mask_Wall_Mordley_spr;

script_execute(Wall_Collision_scr,0,0,0,0,0);
///Normal Mask
mask_index = Mask_Combat_Mordley_spr;

///debug jazz

//stamina = 100;
//healthPoints = hpMax;

//debug speed
if (keyboard_check_pressed(ord("0")))
{
    if (debug == false) { debug = true; }
    else {debug = false;}
}

if (debug) {spd = 13;}

/*
for(var i = 0; i < array_length_1d(cylinder); i++)
{
    cylinder[i] = Bullet_90_obj;
}

/* */
script_execute(Movement_Update_scr,0,0,0,0,0);
/*  */

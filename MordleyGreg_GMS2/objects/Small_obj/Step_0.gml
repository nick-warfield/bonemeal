if(place_meeting(x, y, Player02_obj) == false) 
{spd = 0;}

///Pause Check

if (global.paused) {exit;}

script_execute(Var_Collision_scr,0,0,0,0,0);
///Small Object Collision
if (place_meeting(x + newX, y + newY, Small_obj))
{ spd = 0; }

script_execute(Var_Collision_scr,0,0,0,0,0);
script_execute(Wall_Collision_scr,0,0,0,0,0);
script_execute(Movement_Update_scr,0,0,0,0,0);

//collisions for Character objects

value = state[s_ACTIVE];


//wall collision
//detect wall in horizontal axis
if (place_meeting(x + hspeed, y, Wall_obj) || place_meeting(x, y + vspeed, Wall_obj))
{
    value = state[s_IDLE];
}

return value;

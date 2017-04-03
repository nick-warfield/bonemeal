///SetDamageVars_scr(hurter, knockbackForce, knockbackTime, damage, invulTime, sound)

var paramcount = argument_count;

switch (paramcount)
{
  //polish chunck
  case 6:
    hurtNoise = argument[5];

  //damage chunck
  case 5:
    damage = argument[3];
    
    //if no invulnerability is specified, use default value
    if (argument[4] == NULL) {invulTime = 1000;}
    else {invulTime = argument[4];}

  //knockback chunck
  case 3:
    hurter = argument[0];
    knockbackForce = argument[1];
    knockbackTime = argument[2];
    
    if (paramcount == 3)
    {
        Dir = point_direction(hurter.x, hurter.y, x, y);
        spd = knockbackForce
        timeStamp[1] = current_time + knockbackTime;
    }
    
    break;
}

/*
//first chunck, need all 3 for calculating knockbacks
if (paramcount == 3)
{
    hurter = argument[0];
    knockbackForce = argument[1];
    knockbackTime = argument[2];
    
    Dir = point_direction(hurter.x, hurter.y, x, y);
    spd = knockbackForce
    timeStamp[1] = current_time + knockbackTime;
}

//second chunck, stuff needed for calculating damage
else if (paramcount == 5)
{
    damage = argument[3];
        //if no invulnerability is specified, use default value
    if (argument[4] == NULL) {invulTime = 1000;}
    else {invulTime = argument[4];}
}

//third chunck, polish effects
else
{
    hurtNoise = argument[5];
}

if (place_meeting(x + newX, y + newY, Small_obj) == true)
{
    var thing = instance_place(x + newX, y + newY, Small_obj);
    
    if (instance_exists(thing) && thing != id)
    {
        spd /= 2;
        thing.spd = spd;
        
        thing.Dir = point_direction(x, y+11, thing.x, thing.y);
        
        
        /*
        if(facing == UP)
        { if (Dir > 0 && Dir < 180) {thing.Dir = Dir;} }
        else if (facing == DOWN)
        { if (Dir > 180 && Dir < 360) {thing.Dir = Dir;} }
        else if (facing == LEFT)
        { if (Dir > 90 && Dir < 270) {thing.Dir = Dir;} }
        else if (facing == RIGHT)
        { if (Dir > 270 && Dir < 90) {thing.Dir = Dir;} }
        else {thing.spd = 0;}
        */
        
        /*
        
        thing.Dir = Dir;
        
        if (facing == UP)
        {
            if (Dir <= 360 && Dir >= 180) {thing.spd = 0;}
            else {thing.Dir = Dir;}
        }
        else if (facing == RIGHT)
        {
            if (Dir <= 90 && Dir >= 270) {thing.spd = 0;}
            else {thing.Dir = Dir;}
        }
        
        script_execute(Var_Collision_scr);
        with (thing) {script_execute(Var_Collision_scr);}        
        */
    }
}

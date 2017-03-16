//wall collision


newX = lengthdir_x(spd, Dir);
newY = lengthdir_y(spd, Dir);

//show_debug_message(newX);
//show_debug_message(newY);


//Character Collisions
//horizontal collisions
/*
if (place_meeting(x + newX, y, Character_obj) == true)
{
    var thing = instance_place(x + newX, y, Character_obj);

    if (instance_exists(thing) && thing != id)
    {
        var cx = newX + thing.newX;
        var cy = newY + thing.newY;
        
        spd = sqrt(sqr(cx) + sqr(cy));
        Dir = arcsin(cx/spd);
    }
}*/
if (place_meeting(x + newX, y + newY, Character_obj) == true)
{
    var thing = instance_place(x + newX, y + newY, Character_obj);

    if (instance_exists(thing) && thing != id)
    {
        var cx = newX + thing.newX;
        var cy = newY + thing.newY;
        
        //if(id.object_index == Player02_obj) { show_debug_message(cx); }
        
        spd = sqrt(sqr(cx) + sqr(cy));
        
        //need to use some logic so that the direction will always be counter clockwise in relation to moving right
        //if no horizontal movement, then if no vertical movement
        if (cx == 0) { if (cy < 0) { Dir = 90; } else { Dir = 270; } }
        else if (cy == 0) { if (cx > 0) { Dir = 0; } else { Dir = 180; } }
        else
        {
            if(abs(cx) > abs(cy)) { Dir = arctan(abs(cy)/abs(cx)); } 
            else { Dir = arctan(abs(cx)/abs(cy)); }
            
            //if (id.object_index = Player02_obj) { show_debug_message(Dir); }
            
            if (cx > 0)
            {
                if (cy > 0) { Dir = 360 - Dir; }
            }
            else
            {
                if (cy > 0) { Dir = 180 + Dir; }
                else { Dir = 180 - Dir; }
            }
            
            /*
            if (cx < 0 && cy < 0) 
            {
                Dir = 180 - Dir;
            }
            else if (cx < 0 && cy > 0)
            {
                Dir = 180 + Dir;
            }
            else if (cx > 0 && cy < 0)
            {
                Dir = 360 - Dir;
            }
            */
            
            //if (id.object_index = Player02_obj) { show_debug_message(Dir); }
        }
        
        /*
        else if (cx > 0 && cy > 0)  //if vector is in quadrant 1
        {
            if (cx > cy) { Dir = arcsin(cy/spd); }
            else { Dir = arcsin(cx/spd); }
        }
        else if (cx < 0 && cy > 0)  //if vector is in quadrant 2
        {
            if (-cx > cy) { Dir = arcsin(cy/spd); }
            else { Dir = arcsin(cx/spd); }
            Dir = 180 - Dir;
        }
        else if (cx < 0 && cy < 0)  //if vector is in quadrant 3
        {
            if (-cx > -cy) { Dir = arcsin(cy/spd); }
            else { Dir = arcsin(cx/spd); }
            Dir += 180;
        }
        else if (cx > 0 && cy < 0)  //if vector is in quadrant 4
        {
            if (cx > -cy) { Dir = arcsin(cy/spd); }
            else { Dir = arcsin(cx/spd); }
            Dir = 360 - Dir;
        }
        */
    }
}

/*    
    if (instance_exists(thing) && thing != id)
    {
        Dir = (Dir + thing.Dir) / 2;
        thing.Dir = Dir;
    }


    //left
    if (Dir == 180) { spd /= 2; }
    else if (Dir > 90 && Dir < 180) { spd /= 1.5; }       //force up
    else if (Dir > 180 && Dir < 270) { spd /= 1.5; }     //force down
    
    //right
    if (Dir == 0 || Dir == 360) { spd /= 2; }
    else if (Dir > 0 && Dir < 90) { spd /= 1.5; }         //force up
    else if (Dir > 270 && Dir < 360) { spd /= 1.5; }     //force down
*/


/*
//vertical collisions
if (place_meeting(x, y + newY, Character_obj) == true)
{
    var thing = instance_place(x + newX, y, Character_obj);
    
    if (instance_exists(thing) && thing != id)
    {
        Dir = dot_product(x, y, thing.x, thing.y);
        thing.Dir = Dir;
        spd /= 2;
    }
    
/*    
    if (instance_exists(thing) && thing != id)
    {
        Dir = (Dir + thing.Dir) / 2;
        thing.Dir = Dir;
    }


    //up
    if (Dir == 90) { spd /= 2; }
    else if (Dir > 0 && Dir < 90) { spd /= 1.5; }       //force right
    else if (Dir > 90 && Dir < 180) { spd /= 1.5; }     //force left
    
    //down
    if (Dir == 270) { spd /= 2; }
    else if (Dir > 270 && Dir < 360) { spd /= 1.5; }         //force right
    else if (Dir > 180 && Dir < 270) { spd /= 1.5; }     //force left
}
*/



//Wall Collisions
//newX = lengthdir_x(spd, Dir);
//newY = lengthdir_y(spd, Dir);

//horizontal collisions
if (place_meeting(x + newX, y, Wall_obj) == true)
{
    //left
    if (Dir == 180) { spd = 0; }
    else if (Dir > 90 && Dir < 180) { Dir = 90; spd /= 1.5; }       //force up
    else if (Dir > 180 && Dir < 270) { Dir = 270; spd /= 1.5; }     //force down
    
    //right
    if (Dir == 0 || Dir == 360) { spd = 0; }
    else if (Dir > 0 && Dir < 90) { Dir = 90; spd /= 1.5; }         //force up
    else if (Dir > 270 && Dir < 360) { Dir = 270; spd /= 1.5; }     //force down
}

//vertical collisions
if (place_meeting(x, y + newY, Wall_obj) == true)
{
    //up
    if (Dir == 90) { spd = 0; }
    else if (Dir > 0 && Dir < 90) { Dir = 0; spd /= 1.5; }       //force right
    else if (Dir > 90 && Dir < 180) { Dir = 180; spd /= 1.5; }     //force left
    
    //down
    if (Dir == 270) { spd = 0; }
    else if (Dir > 270 && Dir < 360) { Dir = 0; spd /= 1.5; }         //force right
    else if (Dir > 180 && Dir < 270) { Dir = 180; spd /= 1.5; }     //force left
}


//movement update
motion_set(Dir, spd);

//x += newX;
//y += newY;


//motion_set(Dir, tempSpd);

/*
//detect wall in horizontal axis
if (place_meeting(x + hspeed, y, Wall_obj) == true)
{
    //move as close to the wall as possible
    while (place_meeting(x + sign(hspeed), y, Wall_obj) == false)
    {
        x += sign(hspeed);
    }
    //stop horizontal movement
    if (sign(hspeed) == -1)
    {
        if (Dir > 90 && Dir < 270) { spd = 0; }
        else { spd = 3; }
    }
}
/*
//detect wall in vertical axis
if (place_meeting(x, y + vspeed, Wall_obj) == true)
{
    //move as close to the wall as possible
    while (place_meeting(x, y + sign(vspeed), Wall_obj) == false)
    {
        y += sign(vspeed);
    }
    //stop vertical movement
    spd = 0;
}
//this collision code works great for things that look they shouldn't move at all
//but it makes things that ought to move immovable


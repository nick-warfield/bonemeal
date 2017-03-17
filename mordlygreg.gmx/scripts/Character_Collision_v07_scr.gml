
if (place_meeting(x + newX, y + newY, Character_obj) == true)
{
    var thing = instance_place(x + newX, y + newY, Character_obj);
    
    if (instance_exists(thing) && thing != id)
    {
        var cx = newX + thing.newX;
        var cy = newY + thing.newY;
        
        spd = sqrt(sqr(cx) + sqr(cy));      //use pythagorian theorem to get magnitude of new vector

        if (cx != 0)
        {
            Dir = arctan(abs(cy)/abs(cx));      //gets the direction relative to RIGHT
            Dir = (Dir * 180) / pi;             //convert from Radians to Degrees
        }
        else { if (cy > 0) {Dir = 90;} else {Dir = 0;} }
        
        //Adjusts the direction depending on the quadrant the vector is in
        if (cx > 0)
        {
            if (cy > 0) { Dir = 270 + Dir; }    //quad 4
        }
        else
        {
            if (cy >= 0) { Dir = 180 + Dir; }    //quad 3
            else { Dir = 90 + Dir; }            //quad 2
        }
        
        //if (object_index == Player02_obj)
        {
        //show_debug_message(cx);
        //newX = cx;
        //newY = cy;
        //show_debug_message(newX);
        //game_end();
        }
        
        //if (distance_to_object(thing) <= distance_to_point(x + newX, y + newY)) 
        {
            //show_debug_message("HI");
        }
        
    }
}

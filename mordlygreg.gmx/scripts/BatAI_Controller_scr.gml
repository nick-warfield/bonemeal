if (instance_exists(target))
{
    theDistance = point_distance(x, y, target.x, target.y);
    //show_debug_message(theDistance);
    
    if (theDistance <= (5*32) && reset == true)
    {
        //agitated state
        timeStamp[0] = current_time + random_range(1000, 3000);
        reset = false;
        show_debug_message(timeStamp[0]);
        //move_towards_point(target.xprevious, target.yprevious, spd);
    }
    
    if (reset = false)
    {
        if (i % 10 == 0)
        {
            randx = random_range(x-100, x+100);
            randy = random_range(y-100, y+100);
        }
        
        i++;
        if (hit == false)
        {
            move_towards_point(randx, randy, spd/3); 
        }
        else
        {
            motion_set(randDirection, spd);
        }
        
    }
    else
    { speed = 0; }
    
    //charge player
    if ((timeStamp[0] <= current_time || timeStamp[1] <= current_time) && reset == false)
    {
        if (runOnce == true)
        {
            show_debug_message("HIT");
            oldx = target.x;
            oldy = target.y;
            runOnce = false;
            timeStamp[1] = current_time + 3000;
        }
        
        move_towards_point(target.x, target.y, spd);
    }
    
    //reset bat
    if (timeStamp[1] <= current_time && runOnce == false)
    {
        show_debug_message("RESET");
        reset = true;
        runOnce = true;
        i = 0;
        hit = false;
    }
    
    if (theDistance > 500)
    { move_towards_point(target.x, target.y, spd); }
    
    //hurt player if they get hit
    if (place_meeting(x, y, target) == true)
    {
        with(target)
        {
            script_execute(state[s_DAMAGED], 1);
            //show_debug_message(healthPoints);
        }
        
        randDirection = random(360);
        hit = true;
    }
}

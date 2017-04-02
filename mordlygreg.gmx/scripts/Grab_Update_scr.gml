with (arm)
{
    grabbed = instance_place(x, y, all);
    
    if (grabbed == noone) {grabbed = -10;}  //enter null data if nothing found
    else {grabbed = grabbed.object_index;}  //set up grabbed for switch statement
    
    //do something different based on what was grabbed
    switch (grabbed)
    {
      case (Wall_obj):
        with (Boss_obj)
        {
            Dir = point_direction(x, y, arm.x, arm.y);
            xMaxSpd = x + lengthdir_x(10*32, Dir);
            yMaxSpd = y + lengthdir_y(10*32, Dir);
            //spd = 4;
            ds_stack_push(StateStack, s_ATTACK2);
        }
        instance_destroy();
        
        break;
     
      case (Player02_obj):
        grabbed.x = x;
        grabbed.y = y - 33;
        
        direction = point_direction(x, y, Boss_obj.x, Boss_obj.y);
        speed = 5;
         
        with (Boss_obj)
        {
            if (place_meeting(x, y, target))
            {
                with(arm) {instance_destroy();} 
                
                ds_stack_pop(StateStack);
                timeStamp[2] = current_time + 2000;
            }
        }
        
        break;
           
    }   //switch end

}

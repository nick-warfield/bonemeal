show_debug_message("Event = " + async_load[? "event_type"]);        //debug code to see which event has begun
show_debug_message("Pad = " + string(async_load[? "pad_index"]));   //triggered and the pad associated with it

switch(async_load[? "event_type"])                  //Parse the async_load map to see which event has been triggered
{
    case "gamepad discovered":                      //A gamepad has been discovered
        var pad = async_load[? "pad_index"];        //Get the pad index value from the async_load map
        gamepad_set_axis_deadzone(pad, 0.5);        //set the "deadzone" for the axis
        gamepad_set_button_threshold(pad, 0.1);     //set the "threshold" for the triggers
        
        break;
        
    case "gamepad lost":                            //Gamepad has been remoced or otherwise disabled
        var pad = async_load[? "pad_index"];        //get the pad index
        if (instance_exists(player[pad]))           //check for a player instance associated with the pad and remove it
            {
                with (player[pad])
                {
                    instance_destroy();
                }
                player[pad] = noone;                //set the controller array to "noone" so it detects a new pad being connected
            }
            break;
}

//interact with stuff

Input[INTERACT] = false;

if (facing == RIGHT)
{
    var thing = collision_rectangle(x, y, x + 24, y, all, false, true);
}
else if (facing == LEFT)
{
    var thing = collision_rectangle(x - 24, y, x, y, all, false, true);
}
else if (facing == UP)
{
    var thing = collision_rectangle(x, y - 40, x, y, all, false, true);
}
else if (facing == DOWN)
{
    var thing = collision_rectangle(x, y, x, y + 40, all, false, true);
}


var cam = instance_find(Camera_obj, 1);
cam.done = true;

if (instance_exists(thing) && (thing.object_index != Character_obj || thing.object_index != Projectile_obj))
{
    var hype = thing.object_index;

    //first time through, check for exact object, second time check if their is a parent with the same id
    for (var i = 0; i < 2; i++)
    {
    i++;    //advance the loop so that it will only run once
    
    
    switch (hype)
    {
      case (Combination_Puzzle_obj):
        if (thing.order == 0)
        {
            thing.order = thing.door.count;
            thing.door.count--;
        }
        break;
    
      case (Key_obj):
        keys++;
        with (thing) { instance_destroy(); }
        break;
    
      case (Gate_obj):
        if (keys > 0)
        {
          thing.locked = false;
          keys--;
          break;
        }
    
      case (Sign_obj):
        for (var i = 0; i < array_length_1d(thing.message); i++)
        {
            cam.message[i] = thing.message[i];
        }
        
        cam.messageCurrent = thing.messageCurrent;
        cam.portrait = thing.portrait;
        cam.done = thing.done;
        break;
        
      default:
        hype = object_get_parent(hype);     //initialize local variable for 2nd check
        i--;                                //set the loop back so that it will run a second time
        break;
        
    }   //switch end
    
    }   //for loop end
}

/*
if (thing != noone)
{
  switch (thing.type)
  {
    case ("Lock"):
      if (keys > 0)
      {
        thing.locked = false;
        keys--;
        cam.done = true;
        break;
      }
  
    case ("Sign"):
      for (var i = 0; i < array_length_1d(thing.message); i++)
        {
            cam.message[i] = thing.message[i];
        }
        
        cam.messageCurrent = thing.messageCurrent;
        cam.portrait = thing.portrait;
        cam.done = thing.done;
        break;
            
    default:
      cam.done = true;
      break;
  }
}
else { cam.done = true; }

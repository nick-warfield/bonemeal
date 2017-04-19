//interact with stuff

Input[INTERACT] = false;

var cam = instance_find(Camera_obj, 1);
cam.done = true;

var thing = 0;
//var hype = 0;

//check puzzle interact
if (facing == RIGHT)
{ thing = collision_rectangle(x, y, x + 36, y, Combination_Puzzle_obj, false, true); }
else if (facing == LEFT)
{ thing = collision_rectangle(x - 36, y, x, y, Combination_Puzzle_obj, false, true); }
else if (facing == UP)
{ thing = collision_rectangle(x, y - 48, x, y, Combination_Puzzle_obj, false, true); }
else if (facing == DOWN)
{ thing = collision_rectangle(x, y, x, y + 48, Combination_Puzzle_obj, false, true); }

if (thing != 0 && instance_exists(thing))
{
    if (thing.order == 0)
    {
        thing.order = thing.door.count;
        thing.door.count--;
    }
}


thing = 0;

//check gates
if (facing == RIGHT)
{ thing = collision_rectangle(x, y, x + 36, y, Gate_obj, false, true); }
else if (facing == LEFT)
{ thing = collision_rectangle(x - 36, y, x, y, Gate_obj, false, true); }
else if (facing == UP)
{ thing = collision_rectangle(x, y - 48, x, y, Gate_obj, false, true); }
else if (facing == DOWN)
{ thing = collision_rectangle(x, y, x, y + 48, Gate_obj, false, true); }

if (thing != 0 && instance_exists(thing))
{
    if (keys > 0)
    {
      thing.locked = false;
      thing.gatetxt.message[0] = "It Opened!";
      keys--;
    }
}


thing = 0;

//check signs
if (facing == RIGHT)
{ thing = collision_rectangle(x, y, x + 36, y, Sign_obj, false, true); }
else if (facing == LEFT)
{ thing = collision_rectangle(x - 36, y, x, y, Sign_obj, false, true); }
else if (facing == UP)
{ thing = collision_rectangle(x, y - 48, x, y, Sign_obj, false, true); }
else if (facing == DOWN)
{ thing = collision_rectangle(x, y, x, y + 48, Sign_obj, false, true); }

if (thing != 0 && instance_exists(thing))
{
    for (var i = 0; i < array_length_1d(thing.message); i++)
    {
        cam.message[i] = thing.message[i];
    }
    
    cam.messageCurrent = thing.messageCurrent;
    cam.portrait = thing.portrait;
    cam.done = thing.done;
}


/*
if (thing != 0 && instance_exists(thing))
{
    hype = thing.object_index;

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

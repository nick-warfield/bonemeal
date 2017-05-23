//Wall Collisions

//set a different collision mask here, so that walking around is easier

//current wall collisions work if the center of a character object will collide with a wall
//but if the center doesn't reach a wall, the edges of the collision mask can get stuck

if (global.paused) {exit;}

if (Dir >= 360) {Dir -= 360;}
else if (Dir < 0) {Dir += 360;}

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

//then reset collisions back to normal so that more precise collisions can be used with combat

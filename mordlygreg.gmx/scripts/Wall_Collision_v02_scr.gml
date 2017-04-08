//Wall Collisions

//set a different collision mask here, so that walking around is easier

//current wall collisions work if the center of a character object will collide with a wall
//but if the center doesn't reach a wall, the edges of the collision mask can get stuck

/*
var xoffset = bbox_right;
if (sign(newX) < 0) { xoffset = bbox_left; }
xoffset = (xoffset + x) / 2;

var yoffset = bbox_bottom;
if (sign(newY) < 0) { yoffset = bbox_top; }
yoffset = (yoffset + y) / 2;
*/

var forceOut = false;

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

/*
while (place_meeting(x+sign(newX), y+sign(newY), Wall_obj) && forceOut == false)
{
    if (Dir == 0 || Dir == 360) {x--;}
    else if (Dir == 180) {x++;}
    else if (Dir == 90) {y++;}
    else if (Dir == 270) {y--;}
    else
    {
        if (Dir > 90 && Dir < 270) {x++;}
        else if (Dir > 270 && Dir < 90) {x--;}
        //else {forceOut = true;}
    
        if (Dir > 0 && Dir < 180) {y++; forceOut = false;}
        else if (Dir > 180 && Dir < 360) {y--; forceOut = false;}
        //else {forceOut = true;}
    }
}


//then reset collisions back to normal so that more precise collisions can be used with combat

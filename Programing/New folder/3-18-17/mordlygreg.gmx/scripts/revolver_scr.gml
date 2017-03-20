
chamberX = view_xport[view_current];
chamberY = view_yport[view_current];
//Maybe go back to the if statements? goes back to full chamber sprite (image 0) after full cycle
switch (cylinderPosition)
{
case 1:
draw_sprite(chamber00_spr, 6, chamberX + 50 , chamberY + 600);
break;

case 2:
draw_sprite(chamber00_spr, 5, chamberX + 50 , chamberY + 600);
break;

case 3:
draw_sprite(chamber00_spr, 4, chamberX + 50 , chamberY + 600);
break;

case 4:
draw_sprite(chamber00_spr, 3, chamberX + 50 , chamberY + 600);
break;

case 5:
draw_sprite(chamber00_spr, 2, chamberX + 50 , chamberY + 600);
break;

//case 6:
draw_sprite(chamber00_spr, 1, chamberX + 50 , chamberY + 600);
break;

case 0:
draw_sprite(chamber00_spr, 0, chamberX + 50 , chamberY + 600);
break;
}


/*
if (cylinderPosition = 1)
{
draw_sprite(chamber00_spr, 6, chamberX + 50 , chamberY + 600);
} 

if (cylinderPosition = 2)
{
draw_sprite(chamber00_spr, 5, chamberX + 50  , chamberY + 600);
} 

if (cylinderPosition = 3)
{
draw_sprite(chamber00_spr, 4, chamberX + 50  , chamberY + 600);
} 

if (cylinderPosition = 4)
{
draw_sprite(chamber00_spr, 3, chamberX + 50  , chamberY + 600);
} 

if (cylinderPosition = 5)
{
draw_sprite(chamber00_spr, 2, chamberX + 50  , chamberY + 600);
} 

if (cylinderPosition = 6)
{
draw_sprite(chamber00_spr, 1, chamberX + 50  , chamberY + 600);
} 



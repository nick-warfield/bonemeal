//xoffsets
var leftPage = room_width/4;
var rightPage = room_width/2 + 80;

//text colors
var tc1 = c_navy;
var tc1_1 = tc1;

var tc2 = tc1;
var tc2_1 = tc2;

var tc3 = tc2;

var tc4 = tc3;
var tc4_1 = tc4;
var tc4_2 = tc4;

var tc5 = tc4;
var tc5_1 = tc5;
var tc5_2 = tc5;

var tc6 = tc5;
var tc7 = tc6;

//text scales
var ts1 = 1;
var ts2 = ts1;
var ts3 = ts2;
var ts4 = ts3;
var ts5 = ts4;

//text spacing
var tp0 = room_height/2 - 128;
var tp1 = room_height/2 - 102;
var tp2 = tp1 + 25;
var tp3 = tp2 + 26;
var tp4 = tp3 + 30;
var tp5 = tp4 + 25;
var tp6 = tp5 + 29;
var tp7 = tp6 + 30;
var tp8 = tp7 + 30;
var tp9 = tp8 + 24;


var tph1 = leftPage;
var tph2 = leftPage;
var tph3 = leftPage;
var tph4 = rightPage;
var tph4_1 = rightPage;
var tph4_2 = rightPage + 75;
var tph5 = rightPage;
var tph5_1 = rightPage;
var tph5_2 = rightPage + 75;
var tph6 = rightPage;
var tph7 = rightPage;


var mx = room_width/2 + 55;
var my = 0;


//change text based on selction
switch (selection)
{
  //GUI Scale
  case 0:
    tc1 = c_purple;
    ts1 += 0.5
    tph1 += 10;
    
    mx = leftPage - 27;
    my = tp2;
    break;
    
    case 0.1:
      tc1_1 = c_purple;
      mx = leftPage - 20;
      my = tp3;
      break;
    
  //Volume
  case 1:
    tc2 = c_purple;
    ts2 += 0.5
    tph2 += 10;
    
    mx = leftPage - 27;
    my = tp5;
    break;
    
    case 1.1:
      tc2_1 = c_purple;
      mx = leftPage - 20;
      my = tp6;
      break;
    
  //BACK Button
  case 2:
    tc3 = c_purple;
    ts3 += 0.5
    tph3 += 10;
    
    mx = leftPage - 12;
    my = tp9;
    break;
    
  //NO DAMAGE
  case 3:
    tc4 = c_purple;
    ts4 += 0.5
    tph4 += 10;
    my = tp1;
    break;
    
    //ON
    case 3.1:
      tc4_1 = c_purple;
      tph4_1 += 10;
      
      my = tp2;
      break;
      
    //OFF
    case 3.2:
      tc4_2 = c_purple;
      tph4_2 += 10;
      
      mx += 75;
      my = tp2;
      break;
    
  //Keys
  case 4:
    tc5 = c_purple;
    ts5 += 0.5
    tph5 += 10;
    
    my = tp4;
    break;
    
    //KEY++
    case 4.1:
      tc5_1 = c_purple;
      tph5_1 += 10;
      
      my = tp5;
      break;
      
    //BIGKEY++
    case 4.2:
      tc5_2 = c_purple;
      tph5_2 += 10;
      
      mx += 75;
      my = tp5;
      break;
    
  //Room Reset
  case 5:
    tc6 = c_purple;
    tph6 += 10;
    my = tp7;
    break;
    
  //Exit Demo
  case 6:
    tc7 = c_purple;
    tph7 += 10;
    my = tp9;
    break;
}


draw_set_halign(fa_center);

//background
draw_sprite(global.pauseBkg, 0, 0, 0);
draw_sprite(Alpha_Fade_spr, 0, 0, 0);

//journal
draw_sprite(Journal_spr, 0, room_width/2, room_height/2 - 25);


draw_set_halign(fa_left);
draw_set_valign(fa_bottom);


//left page stuff
//title line
draw_text_transformed_colour(leftPage + 30, tp0, string_hash_to_newline("Options:"), 1, 1, 0, c_purple, c_purple, c_purple, c_purple, 1);

//line 1
//draw_text_transformed_colour(leftPage, tp1, "Move: WASD/Arrow Keys", 1, 1, 0, tc1, tc1, tc1, tc1, 1);

//line 2
draw_text_transformed_colour(tph1, tp2, string_hash_to_newline("GUI Scale:"), 1, 1, 0, tc1, tc1, tc1, tc1, 1);

//line 3
if (selection != 0.1) {draw_line_width_colour(leftPage + 15, tp3-9, leftPage, tp3-9, 2, tc1_1, tc1_1);}
draw_line_width_colour(leftPage + 60, tp3-9, leftPage*1.65, tp3-9, 2, tc1_1, tc1_1);
draw_text_transformed_colour(leftPage + 20, tp3, string_hash_to_newline(string_format(global.scaleFactor, 1, 2)), 1, 1, 0, tc1_1, tc1_1, tc1_1, tc1_1, 1);

//line 4
//draw_text_transformed_colour(leftPage, tp4, "Aim: Space", 1, 1, 0, tc4, tc4, tc4, tc4, 1);

//line 5
draw_text_transformed_colour(tph2, tp5, string_hash_to_newline("Volume:"), 1, 1, 0, tc2, tc2, tc2, tc2, 1);

//line 6
var num = 45;
if (audio_get_master_gain(0) == 1) {num = 55;}
else if (audio_get_master_gain(0) < 0.1) {num = 35;}

if (selection != 1.1) {draw_line_width_colour(leftPage + 15, tp6-9, leftPage, tp6-9, 2, tc2_1, tc2_1);}
draw_line_width_colour(leftPage + num, tp6-9, leftPage*1.65, tp6-9, 2, tc2_1, tc2_1);
draw_text_transformed_colour(leftPage + 20, tp6, string_hash_to_newline(round(audio_get_master_gain(0)*100)), 1, 1, 0, tc2_1, tc2_1, tc2_1, tc2_1, 1);

//line 7
//draw_text_transformed_colour(leftPage, tp7, "Dodge: Left Shift", 1, 1, 0, tc2, tc2, tc2, tc2, 1);

//line 8
//draw_text_transformed_colour(leftPage, tp8, "Interact: E", 1, 1, 0, tc2, tc2, tc2, tc2, 1);

//line 9
draw_text_transformed_colour(tph3 + 15, tp9, string_hash_to_newline("BACK"), 1, 1, 0, tc3, tc3, tc3, tc3, 1);



//Right Page Stuff
//title line
draw_text_transformed_colour(rightPage - 9, tp0, string_hash_to_newline("Debug: [In Game Only]"), 1, 1, 0, c_purple, c_purple, c_purple, c_purple, 1);

//line 1
draw_text_transformed_colour(tph4, tp1, string_hash_to_newline("No Damage:"), 1, 1, 0, tc4, tc4, tc4, tc4, 1);

//line 2
draw_text_transformed_colour(tph4_1, tp2, string_hash_to_newline("OFF"), 1, 1, 0, tc4_1, tc4_1, tc4_1, tc4_1, 1);
draw_text_transformed_colour(tph4_2, tp2, string_hash_to_newline("ON"), 1, 1, 0, tc4_2, tc4_2, tc4_2, tc4_2, 1);

//line 3
//draw_text_transformed_colour(tph3, tp3, "Add Keys: 0 :: 0", 1, 1, 0, tc3, tc3, tc3, tc3, 1);

//line 4
draw_text_transformed_colour(tph5, tp4, string_hash_to_newline("Add Keys:"), 1, 1, 0, tc5, tc5, tc5, tc5, 1);

//line 5
var k = 0; if (instance_exists(Player02_obj)) {k = Player02_obj.keys;}
var bk = 0; if (instance_exists(Player02_obj)) {bk = Player02_obj.bigKey;}

draw_text_transformed_colour(tph5_1, tp5, string_hash_to_newline("K: " + string(k)), 1, 1, 0, tc5_1, tc5_1, tc5_1, tc5_1, 1);
draw_text_transformed_colour(tph5_2, tp5, string_hash_to_newline("BK: " + string(bk)), 1, 1, 0, tc5_2, tc5_2, tc5_2, tc5_2, 1);


//line 6

//line 7
draw_text_transformed_colour(tph6, tp7, string_hash_to_newline("RESET ROOM"), 1, 1, 0, tc6, tc6, tc6, tc6, 1);

//line 8

//line 9
draw_text_transformed_colour(tph7, tp9, string_hash_to_newline("MAIN MENU"), 1, 1, 0, tc7, tc7, tc7, tc7, 1);



//pointer
draw_sprite(Mordley_Side_Aim_spr, 0, mx, my - 1);



/*
if (Input[INTERACT]) {aniCount = 0;}
if (aniCount < 6)
{
    draw_sprite(Bullet_Ani_spr, aniCount, room_width/2 + 95, my - 11);
    aniCount += 0.5;
}



/* */
/*  */

var version = "version: 2.2.2";

//xoffsets
var leftPage = room_width/4;
var rightPage = room_width/2 + 80;

//text colors
var tc1 = c_navy;
var tc2 = tc1;
var tc3 = tc2;
var tc4 = tc3;
var tc5 = tc4;

//text scales
var ts1 = 1;
var ts2 = ts1;
var ts3 = ts2;
var ts4 = ts3;
var ts5 = ts4;

//text spacing
var tp1 = room_height/2 - 102;
var tp2 = tp1 + 25;
var tp3 = tp2 + 26;
var tp4 = tp3 + 30;
var tp5 = tp4 + 25;

var tph1 = rightPage;
var tph2 = rightPage;
var tph3 = rightPage;
var tph4 = rightPage;
var tph5 = rightPage;

var my;


//change text based on selction
switch (selection)
{
  case 0:
    tc1 = c_purple;
    ts1 += 0.25
    tph1 += 10;
    my = tp1;
    break;
    
  case 1:
    tc2 = c_purple;
    ts2 += 0.25
    tph2 += 10;
    my = tp2;
    break;
    
  case 2:
    tc3 = c_purple;
    ts3 += 0.25
    tph3 += 10;
    my = tp3;
    break;
    
  case 3:
    tc4 = c_purple;
    ts4 += 0.25
    tph4 += 10;
    my = tp4;
    break;
    
  case 4:
    tc5 = c_purple;
    ts5 += 0.25
    tph5 += 10;
    my = tp5;
    break;
}


draw_set_halign(fa_center);

//background
draw_sprite(Alpha_Fade_spr, 0, 0, 0);

//journal
draw_sprite(Journal_Blank_spr, 0, room_width/2, room_height/2 - 25);


draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

//left page stuff
draw_sprite_ext(Icon_spr, 0, leftPage*1.35, tp1, 1.75, 1.75, 0, c_white, 1);

//Game name, and company
//draw_sprite_ext(Logo_spr, 0, leftPage-12, room_height/2 - 70, 0.5, 0.5, 0, c_white, 1);


draw_text_transformed_colour(leftPage - 12, room_height/2 - 25, string_hash_to_newline("MORDLEY GREG:"), 1.5, 1.5, 0, c_purple, c_purple, c_purple, c_purple, 1);
draw_text_transformed_colour(leftPage + 1, room_height/2, string_hash_to_newline("PRIVATE EYE"), 1.5, 1.5, 0, c_purple, c_purple, c_purple, c_purple, 1);
draw_text_colour(leftPage + 20, room_height/2 + 30, string_hash_to_newline("by: bonemeal"), c_navy, c_navy, c_navy, c_navy, 1);
draw_text_transformed_colour(leftPage + 7, room_height/2 + 123, string_hash_to_newline(version), 1, 1, 0, c_navy, c_navy, c_navy, c_navy, 1);


//Right Page Stuff
draw_sprite(Mordley_Side_Aim_spr, 0, room_width/2 + 55, my - 3);


//line 1
//draw_sprite_ext(startdemo_wrd, 0, tph1, tp1, ts1, ts1, 0, c_white, 1);
draw_text_transformed_colour(tph1, tp1, string_hash_to_newline("START DEMO"), ts1, ts1, 0, tc1, tc1, tc1, tc1, 1);

//line 2
//draw_sprite_ext(controls_wrd, 0, tph2, tp2, ts2, ts2, 0, c_white, 1);
draw_text_transformed_colour(tph2, tp2, string_hash_to_newline("CONTROLS"), ts2, ts2, 0, tc2, tc2, tc2, tc2, 1);

//line 3
//draw_sprite_ext(options_wrd, 0, tph3, tp3, ts3, ts3, 0, c_white, 1);
draw_text_transformed_colour(tph3, tp3, string_hash_to_newline("OPTIONS"), ts3, ts3, 0, tc3, tc3, tc3, tc3, 1);

//line 4
//draw_sprite_ext(credits_wrd, 0, tph4, tp4, ts4, ts4, 0, c_white, 1);
draw_text_transformed_colour(tph4, tp4, string_hash_to_newline("CREDITS"), ts4, ts4, 0, tc4, tc4, tc4, tc4, 1);

//line 5
//draw_sprite_ext(exitdemo_wrd, 0, tph5, tp5, ts5, ts5, 0, c_white, 1);
draw_text_transformed_colour(tph5, tp5, string_hash_to_newline("EXIT DEMO"), ts5, ts5, 0, tc5, tc5, tc5, tc5, 1);


if (Input[INTERACT]) {aniCount = 0;}
if (aniCount < 6)
{
    draw_sprite(Bullet_Ani_spr, aniCount, room_width/2 + 95, my - 11);
    aniCount += 0.5;
}




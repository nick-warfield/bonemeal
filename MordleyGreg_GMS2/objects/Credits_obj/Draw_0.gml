//xoffsets
var leftPage = room_width/4;
var rightPage = room_width/2 + 80;

//text colors
var tc1 = c_navy;
var tc2 = tc1;
var tc3 = tc2;
var tc4 = tc3;
var tc5 = tc4;

//text spacing
var tp1 = room_height/2 - 102;
var tp2 = tp1 + 25;
var tp3 = tp2 + 26;
var tp4 = tp3 + 30;
var tp5 = tp4 + 25;
var tp6 = tp5 + 29;
var tp7 = tp6 + 29;



draw_set_halign(fa_center);

//background
draw_sprite(Alpha_Fade_spr, 0, 0, 0);

//journal
draw_sprite(Journal_Blank_spr, 0, room_width/2, room_height/2 - 25);


draw_set_halign(fa_left);
draw_set_valign(fa_bottom);


//draw_sprite_ext(team_wrd, 0, leftPage, 130, 1, 1, 0, c_white, 1);
//draw_sprite_ext(specialThanks_wrd, 0, rightPage, 130, 1.5, 1.5, 0, c_white, 1);


//left page stuff
//line 1
draw_text_transformed_colour(leftPage, tp1, string_hash_to_newline("Austin Bragger"), 1, 1, 0, tc1, tc1, tc1, tc1, 1);

//line 2
draw_text_transformed_colour(leftPage, tp2, string_hash_to_newline("Ethan Persico"), 1, 1, 0, tc2, tc2, tc2, tc2, 1);

//line 3
draw_text_transformed_colour(leftPage, tp3, string_hash_to_newline("Lacey Hunter"), 1, 1, 0, tc3, tc3, tc3, tc3, 1);

//line 4
draw_text_transformed_colour(leftPage, tp4, string_hash_to_newline("Nicholas Warfield"), 1, 1, 0, tc4, tc4, tc4, tc4, 1);

//line 5
draw_text_transformed_colour(leftPage, tp5, string_hash_to_newline("Sam Bayot"), 1, 1, 0, tc5, tc5, tc5, tc5, 1);

//line 6
draw_text_transformed_colour(leftPage, tp6, string_hash_to_newline("Alexandra Mejia"), 1, 1, 0, tc1, tc1, tc1, tc1, 1);

//line 7
draw_text_transformed_colour(leftPage, tp7, string_hash_to_newline("Dillon Craft"), 1, 1, 0, tc2, tc2, tc2, tc2, 1);


//Right Page Stuff
//line 1
draw_text_transformed_colour(rightPage, tp1, string_hash_to_newline("Special Thanks To:"), 1, 1, 0, tc1, tc1, tc1, tc1, 1);

//line 2
draw_text_transformed_colour(rightPage, tp2, string_hash_to_newline("Tim Samoff"), 1, 1, 0, tc2, tc2, tc2, tc2, 1);

//line 3
draw_text_transformed_colour(rightPage, tp3, string_hash_to_newline("John Bair"), 1, 1, 0, tc3, tc3, tc3, tc3, 1);

//line 4
draw_text_transformed_colour(rightPage, tp4, string_hash_to_newline("Eileen Li"), 1, 1, 0, tc4, tc4, tc4, tc4, 1);

//line 5
draw_text_transformed_colour(rightPage, tp5, string_hash_to_newline("Clinton Bragger"), 1, 1, 0, tc5, tc5, tc5, tc5, 1);



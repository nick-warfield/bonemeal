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



draw_set_halign(fa_center);

//background
draw_sprite(Alpha_Fade_spr, 0, 0, 0);

//journal
draw_sprite(Journal_spr, 0, room_width/2, room_height/2 - 25);


draw_set_halign(fa_left);
draw_set_valign(fa_bottom);


//left page stuff
//title line
draw_text_transformed_colour(leftPage, tp0, string_hash_to_newline("KEYBOARD & MOUSE"), 1, 1, 0, c_purple, c_purple, c_purple, c_purple, 1);

//line 1
draw_text_transformed_colour(leftPage, tp1, string_hash_to_newline("Move: WASD/Arrow Keys"), 0.75, 0.75, 0, tc1, tc1, tc1, tc1, 1);

//line 2
draw_text_transformed_colour(leftPage, tp2, string_hash_to_newline("Melee: Left/Right Click"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 3
draw_text_transformed_colour(leftPage, tp3, string_hash_to_newline("Shoot: Left/Right Click"), 0.75, 0.75, 0, tc3, tc3, tc3, tc3, 1);

//line 4
draw_text_transformed_colour(leftPage, tp4, string_hash_to_newline("Aim: Space"), 0.75, 0.75, 0, tc4, tc4, tc4, tc4, 1);

//line 5
draw_text_transformed_colour(leftPage, tp5, string_hash_to_newline("Reload: R/Scroll Up"), 0.75, 0.75, 0, tc5, tc5, tc5, tc5, 1);

//line 6
draw_text_transformed_colour(leftPage, tp6, string_hash_to_newline("Cycle: Q/Scroll Up"), 0.75, 0.75, 0, tc1, tc1, tc1, tc1, 1);

//line 7
draw_text_transformed_colour(leftPage, tp7, string_hash_to_newline("Dodge: Left Shift"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 8
draw_text_transformed_colour(leftPage, tp8, string_hash_to_newline("Interact: E"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 9
draw_text_transformed_colour(leftPage + 15, tp9, string_hash_to_newline("Pause: P, Escape"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);


//Right Page Stuff
//title line
draw_text_transformed_colour(rightPage, tp0, string_hash_to_newline("Controller"), 1, 1, 0, c_purple, c_purple, c_purple, c_purple, 1);

//line 1
draw_text_transformed_colour(rightPage, tp1, string_hash_to_newline("Move: Left Stick/DPad"), 0.75, 0.75, 0, tc1, tc1, tc1, tc1, 1);

//line 2
draw_text_transformed_colour(rightPage, tp2, string_hash_to_newline("Melee: X Button"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 3
draw_text_transformed_colour(rightPage, tp3, string_hash_to_newline("Shoot: Right Trigger"), 0.75, 0.75, 0, tc3, tc3, tc3, tc3, 1);

//line 4
draw_text_transformed_colour(rightPage, tp4, string_hash_to_newline("Aim: Left Trigger"), 0.75, 0.75, 0, tc4, tc4, tc4, tc4, 1);

//line 5
draw_text_transformed_colour(rightPage, tp5, string_hash_to_newline("Reload: Right Bumper"), 0.75, 0.75, 0, tc5, tc5, tc5, tc5, 1);

//line 6
draw_text_transformed_colour(rightPage, tp6, string_hash_to_newline("Cycle: Left Bumper/Y Button"), 0.75, 0.75, 0, tc1, tc1, tc1, tc1, 1);

//line 7
draw_text_transformed_colour(rightPage, tp7, string_hash_to_newline("Dodge: B Button"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 8
draw_text_transformed_colour(rightPage, tp8, string_hash_to_newline("Interact: A Button"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);

//line 9
draw_text_transformed_colour(rightPage, tp9, string_hash_to_newline("Pause: Start"), 0.75, 0.75, 0, tc2, tc2, tc2, tc2, 1);



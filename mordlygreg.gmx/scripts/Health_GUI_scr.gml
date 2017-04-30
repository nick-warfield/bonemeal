var h = display_get_height()/global.scaleFactor;
var w = display_get_width()/global.scaleFactor;

var amnt = (healthPoints / hpMax) * 100;
var amnt2 = (stamina / staminaMax) * 100;


//draw_sprite(HUD_Card_spr, 0, 12, 12);


draw_line_width_colour(w/2-101, 3, w/2+100, 3, 2, c_white, c_white);
draw_line_width_colour(w/2-101, 21, w/2+100, 21, 2, c_white, c_white);

draw_line_width_colour(w/2-102, 2, w/2-102, 22, 2, c_white, c_white);
draw_line_width_colour(w/2+101, 2, w/2+101, 22, 2, c_white, c_white);

draw_healthbar(w/2-100, 5, w/2+100, 20, amnt, c_maroon, c_red, c_red, 0, true, false);


//draw_circle_colour(w/2-101, 39/2, 12.5, c_white, c_white, false);
//draw_circle_colour(w/2-101, 39/2, 10, c_red, c_red, false);

//draw_circle_colour(w/2+100, 39/2, 12.5, c_white, c_white, false);
//draw_circle_colour(w/2+100, 39/2, 10, c_red, c_red, false);

//draw_healthbar(109, 77, 109+141, 90, amnt2, c_black, c_green, c_green, 0, false, false);

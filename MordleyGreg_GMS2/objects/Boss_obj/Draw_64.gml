//Draw hpbar while fighing the boss
var h = display_get_height()/global.scaleFactor;
var w = display_get_width()/global.scaleFactor;
var num = healthPoints/hpMax * 100;
draw_set_halign(fa_center);


//draw_rectangle_colour(198, h-77, w-198, h-48, c_white, c_white, c_white, c_white, false);

draw_line_width_colour(199, h-77, w-201, h-77, 2, c_white, c_white);
draw_line_width_colour(199, h-49, w-201, h-49, 2, c_white, c_white);
draw_triangle_colour(200, h-77, 200, h-47, 187.5, h-62.5, c_white, c_white, c_white, false);
draw_triangle_colour(w-200, h-77, w-200, h-47, w-187.5, h-62.5, c_white, c_white, c_white, false);


draw_healthbar(200, h-75, w-200, h-50, num, c_navy, c_maroon, c_maroon, 0, false, false);


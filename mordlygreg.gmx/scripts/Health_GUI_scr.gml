var h = display_get_height()/2;
var w = display_get_width()/2;

var amnt = (healthPoints / hpMax) * 100;
var amnt2 = (stamina / staminaMax) * 100;


draw_sprite(HUD_Card_spr, 0, 12, 12);


draw_healthbar(109, 53, 109+141, 66, amnt, c_black, c_red, c_red, 0, false, false);
draw_healthbar(109, 77, 109+141, 90, amnt2, c_black, c_green, c_green, 0, false, false);

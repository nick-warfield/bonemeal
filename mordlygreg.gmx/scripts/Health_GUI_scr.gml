var h = display_get_height()/2;
var w = display_get_width()/2;

var amnt = (Player02_obj.healthPoints / Player02_obj.hpMax) * 100;
var amnt2 = (Player02_obj.stamina / Player02_obj.staminaMax) * 100;


draw_sprite(HUD_Card_spr, 0, w/2, h-16);


draw_healthbar(w/2-31, h-91, w/2+110, h-106, amnt, c_black, c_red, c_red, 0, false, false);
draw_healthbar(w/2-31, h-67, w/2+110, h-82, amnt2, c_black, c_green, c_green, 0, false, false);

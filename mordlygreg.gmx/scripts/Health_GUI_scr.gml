var amnt = (Player02_obj.healthPoints / Player02_obj.hpMax) * 100;
var amnt2 = (Player02_obj.stamina / Player02_obj.staminaMax) * 100;

draw_healthbar(5, 5, 30, 101, amnt, c_black, c_red, c_red, 3, true, true);
draw_healthbar(30, 5, 35, 101, amnt2, c_black, c_green, c_green, 3, true, true);

///ScreenShake_scr(shake)

var num = argument[0];

view_xview[0] += random_range(-num, num);
view_yview[0] += random_range(-num, num);

num *= 0.88;

return num;

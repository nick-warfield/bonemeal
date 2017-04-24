///sin_shift(amplitude, period, phase, half);

var amplitude = argument0, period = argument1, phase = argument2, half = argument3;

if half return abs(amplitude*sin(((pi)/period)*((current_time/1000)+phase)));
else return amplitude*sin(((2*pi)/period)*((current_time/1000)+phase));

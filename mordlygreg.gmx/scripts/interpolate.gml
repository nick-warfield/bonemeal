///interpolate(val 1, val 2, position, bias)

var cap = bias(argument[3], argument[2]);
clamp (cap, 0, 1);
return(lerp(argument[0],argument[1],cap));

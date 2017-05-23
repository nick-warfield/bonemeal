//initialize the switches into an array for access later on
for (var i = 0; i < 9; i++)
{
    plate[i] = instance_find(Pressure_Plate_obj, i);
}

//initialize my gate objects into an array
for (var i = 0; i < 16; i++)
{
    gate[i] = instance_find(Small_Gate_obj, i);
}

//initalize the candles into something i can access later
candle[0] = instance_find(Candle_Blue_obj, 0);
candle[1] = instance_find(Candle_Orange_obj, 0);
candle[2] = instance_find(Candle_Red_obj, 0);
candle[3] = instance_find(Candle_White_obj, 0);

//set a variable on the candles so that order can be tracked
for (var i = 0; i < 4; i++)
{
    candle[i].door = id;
}
count = 4;


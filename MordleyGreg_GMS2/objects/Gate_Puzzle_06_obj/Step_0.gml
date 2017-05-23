//fishman enemy section, top left
if (plate[0].active == true)
{
    gate[0].opened = true;
    gate[1].opened = true;
}
else
{
    gate[0].opened = false;
    gate[1].opened = false;
}


//bottom left section, time bullet through gates section
if (plate[2].active == true)
{
    gate[7].opened = true;
    gate[6].opened = false;
}
else
{
    gate[7].opened = false;
    gate[6].opened = true;
}

//bottom left section, after breaking bottomost, leftmost crate
if (plate[1].active == true)
{
    for (var i = 0; i < 4; i++)
    { gate[i+2].opened = false; }
}
else
{
    for (var i = 0; i < 4; i++)
    { gate[i+2].opened = true; }
}


//top right section, part with switches closer to door
if (plate[3].active == true && plate[4].active == true)
{
    gate[8].opened = true;
    gate[9].opened = false;
}
else if (plate[3].active == true xor plate[4].active == true)
{
    gate[8].opened = false;
    gate[9].opened = false;
}
else
{
    gate[8].opened = false;
    gate[9].opened = true;
}

//top right section, the part that happens after the other part
if (plate[7].active == true)
{
    gate[10].opened = false;
}
else
{
    gate[10].opened = true;
}


//bottom right section
if (plate[8].active == true)
{
    gate[11].opened = true;
}
else
{
    gate[11].opened = false;
}


//center section, the candle bit
if (candle[0].order != 0 && candle[1].order != 0 && candle[2].order != 0 && candle[3].order != 0)
{
    if (candle[0].order == 4 && candle[1].order == 3 && candle[2].order == 2 && candle[3].order == 1)
    {
        gate[12].opened = true;
        gate[13].opened = true;
    }
    else
    {
        //reset puzzle
        count = 4;
        for (var i = 0; i < 4; i++)
        { candle[i].order = 0; }
    }
}
else
{
    gate[12].opened = false;
    gate[13].opened = false;
}

//center section, the boss key bit
if (plate[5].active == true || plate[6].active == true)
{
    gate[14].opened = false;
    gate[15].opened = false;
}
else
{
    gate[14].opened = true;
    gate[15].opened = true;
}



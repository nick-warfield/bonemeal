if (plate1.active == true)
{
    gate1.opened = true;
    gate2.opened = true;
}
else
{
    gate1.opened = false;
    gate2.opened = false;
}


if (plate2.active || plate3.active)
{gate3.opened = false;}
else
{gate3.opened = true;}


//all 3 plates pressed
if (plate4.active && plate5.active && plate6.active)
{
    gate4.opened = true;
    gate5.opened = false;
    gate6.opened = false;
}
//if all plates not pressed
else if (!plate4.active && !plate5.active && !plate6.active)
{
    gate4.opened = true;
    gate5.opened = true;
    gate6.opened = true;
}
//only 1 plate pressed
else if (plate4.active xor plate5.active xor plate6.active)
{
    gate4.opened = false;
    gate5.opened = true;
    gate6.opened = false;
}
//only 1 plate NOT pressed
else if (!plate4.active xor !plate5.active xor !plate6.active)
{
    gate4.opened = false;
    gate5.opened = false;
    gate6.opened = false;
}


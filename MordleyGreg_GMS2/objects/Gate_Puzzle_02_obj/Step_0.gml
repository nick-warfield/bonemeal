if (plate1.active == true)
{gate1.opened = true;}
else
{gate1.opened = false;}

if (plate2.active)
{
    gate2.opened = true;
    gate3.opened = false;
}
else
{
    gate2.opened = false;
    gate3.opened = true;
}


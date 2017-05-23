if (plate1.active == true)
{gate1.opened = true;}
else
{gate1.opened = false;}


if (plate2.active)
{gate2.opened = false;}
else
{gate2.opened = true;}


if (plate3.active || plate4.active)
{gate3.opened = false;}
else
{gate3.opened = true;}


if (plate5.active)
{
    gate4.opened = true;
    gate5.opened = false;
}
else
{
    gate4.opened = false;
    gate5.opened = true;
}


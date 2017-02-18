
if (hspeed == 0)
{
    if(Input[RIGHT])
    {
        Input[RIGHT] = false;
        Input[LEFT] = true;
    }
    else
    {
        Input[LEFT] = false;
        Input[RIGHT] = true;
    }
}

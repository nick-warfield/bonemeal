if (plate1.active == true && plate2.active == true)
{
    gate1.opened = false;
    gate2.opened = true;
    gate3.opened = true;
    gate4.opened = false;
    gate5.opened = false;
}
else if (plate2.active == true xor plate1.active == true)
{
    gate1.opened = true;
    gate2.opened = true;
    gate3.opened = false;
    gate4.opened = true;
    gate5.opened = false;
}
else
{
    gate1.opened = true;
    gate2.opened = false;
    gate3.opened = false;
    gate4.opened = true;
    gate5.opened = true;
}

/*
show_debug_message("---");
show_debug_message(gate1);
show_debug_message(gate2);
show_debug_message(gate3);
show_debug_message(gate4);

/* */
/*  */

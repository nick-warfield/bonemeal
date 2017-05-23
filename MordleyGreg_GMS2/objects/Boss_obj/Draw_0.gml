draw_self();

//reset color to white
draw_set_colour(c_white);

//draw melee attack
if (ds_stack_top(StateStack) == s_ATTACK4)
{
    if (current_time <= timeStamp[3] - 300)
    { draw_line_width(x, y, x+lengthdir_x(5*32, Dir), y+lengthdir_y(5*32, Dir), 10); }
    else
    { draw_line_width_colour(x, y, x+lengthdir_x(5*32, Dir), y+lengthdir_y(5*32, Dir), 10, c_red, c_red); }
}

/*
//draw knockback telegraph
else if (ds_stack_top(StateStack) == s_ATTACK5)
{
    //var elipx = lengthdir_x(6*32, Dir);
    //var elipy = lengthdir_y(6*32, Dir);
    
    var elipx1;
    var elipx2;
    var elipy1;
    var elipy2;    

    if (Dir >= 45 && Dir < 135) 
    { elipx1 = x - 6*32; elipx2 = x + 6*32; elipy1 = y; elipy2 = y - 6*32; }
    else if (Dir >= 135 && Dir < 225)
    { elipx1 = x; elipx2 = x - 6*32; elipy1 = y + 6*32; elipy2 = y - 6*32; }
    else if (Dir >= 225 && Dir < 315)
    { elipx1 = x - 6*32; elipx2 = x + 6*32; elipy1 = y; elipy2 = y + 6*32; }
    else
    { elipx1 = x; elipx2 = x + 6*32; elipy1 = y + 6*32; elipy2 = y - 6*32; }
    
    draw_ellipse(elipx1, elipy1, elipx2, elipy2, false);
}




/* */
/*  */

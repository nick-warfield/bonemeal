//initialize input bools for controllers
    //j = total number of inputs, 10 by default
    //0-3 up, down, left right
    //4 interact
    //5 dodge
    //6 block
    //7 parry
    //8-12 attacks
    var j = 13;
    for (var i = 0; i < j; i = i + 1)
    {
        Input[i] = false;
    }

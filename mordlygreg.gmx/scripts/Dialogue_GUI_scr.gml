//draw_set_font(f_chat);        //change this when I have a custom font to use
draw_set_colour(c_white);       //the color of the text


var messageEnd = array_length_1d(message);      //how many messages are in the array

if (messageEnd > 0 && done != true && message[messageCurrent] != "")
{
    //Text Position
    { var tx = (display_get_width() / 2) - 5; }
    //else { var tx = 60; }
    var ty = 5;

    //Next Message
    if (Player02_obj.Input[INTERACT])
    {
        //If we still have some more messages, go to the next one
        if (messageCurrent < messageEnd - 1)
        { messageCurrent++; }
        else        //if no more, we are done
        { done = true; }
    }

    //The Draw functions will draw over things that already exsist, so the further down it is in the code the higher the draw "layer"
    //Draw Text Box
    draw_sprite(TextBox_GUI_spr, 0, tx, ty);
    
    //Line up the text to fit in the box
    tx -= sprite_get_width(TextBox_GUI_spr);
    tx += 5;
    ty += 5;
    
    //Draw the text
    draw_text_ext(tx, ty, message[messageCurrent], -1, sprite_get_width(TextBox_GUI_spr) - 10);
    
    //Draw Portrait
    switch(portrait)
    {
        case "none":
            break;
            
        default:
            portrait = "none";
    }
}

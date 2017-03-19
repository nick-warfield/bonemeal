//draw_set_font(f_chat);        //change this when I have a custom font to use
draw_set_colour(c_white);       //the color of the text

var messageEnd = array_length_1d(message);      //how many messages are in the array

if (messageEnd > 0)
{
    //Text Position
    if (portrait = "none") { var tx = 5; }
    else {var tx = 60; }
    var ty = view_hview[0] - 55;

    //Next Message
    if (keyboard_check_pressed(ord('E')))
    {
        //If we still have some more messages, go to the next one
        if (messageCurrent < messageEnd - 1)
        { messageCurrent++; }
        else        //if no more, we are done
        { done = true; }
    }

    //The Draw functions will draw over things that already exsist, so the further down it is in the code the higher the draw "layer"
    //Draw Text Box
    draw_sprite(TextBox_GUI_spr, 0, 5, view_hview[0] - 55);
    
    //Draw the text
    draw_text(tx, ty, message[messageCurrent]);
    
    //Draw Portrait
    switch(portrait)
    {
        case "none":
            break;
            
        case "Mordle":
            draw_sprite(Mordley_Front_spr, 0, 5, view_hview[0] - 55);
            break;
            
        default:
            portrait = "none";
    }
}

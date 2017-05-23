//draw_set_font(f_chat);        //change this when I have a custom font to use
draw_set_colour(c_navy);       //the color of the text


//var messageEnd = array_length_1d(message);      //how many messages are in the array

if (messageEnd > 0 && done != true && message[messageCurrent] != "")
{
    global.paused = true;

    //Text Position
    var tx = display_get_width()/(global.scaleFactor * 2);
    var ty = display_get_height()/(global.scaleFactor * 2.5);

    //Next Message
    if (Player02_obj.Input[INTERACT])
    {
        //If we still have some more messages, go to the next one
        if (messageCurrent < messageEnd - 1)
        { messageCurrent++; }
        else        //if no more, we are done
        {                        
            done = true;
            global.paused = false;
        }
    }

    //The Draw functions will draw over things that already exsist, so the further down it is in the code the higher the draw "layer"
    //Draw Text Box
    draw_sprite(Journal_Blank_spr, 0, tx, ty);
    
    //Line up the text to fit in the box
    tx -= sprite_get_width(Journal_Blank_spr)/2;
    ty -= sprite_get_height(Journal_Blank_spr)/2;
    tx += 65;
    ty += 50;
    
    //Draw the text
    draw_set_halign(fa_left);
    draw_text_ext(tx, ty, string_hash_to_newline(message[messageCurrent]), 20, sprite_get_width(Journal_Blank_spr)/2 - 125);
    
    //Draw Portrait
    switch(portrait)
    {
        case "none":
            break;
            
        default:
            portrait = "none";
    }
}
//else if (message[messageCurrent] != "") {global.paused = false;}

//if (done = true) {global.paused = false;}

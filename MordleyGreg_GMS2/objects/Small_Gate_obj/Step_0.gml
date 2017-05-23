///Pause Check

if (global.paused) {exit;}

if(opened)
{
    visible = false;
    mask_index = NOMASK;
    
    //if (y > openy)
    //{y -= 4;}
}
else
{
    visible = true;
    mask_index = BlankTile01_spr;
    
    //if (y < closey)
    //{y += 4;}
}


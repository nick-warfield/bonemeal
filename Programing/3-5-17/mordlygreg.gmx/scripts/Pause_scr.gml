show_debug_message("Pause");



















/*
pauseSurf = surface_create(view_wview[0], view_hview[0]);

surface_set_target(pauseSurf);
draw_clear_alpha(c_black, 0);
with(all)
{
    if (visible == true)
        {
            x = x-view_xview[0];
            y = y-view_yview[0];
            event_perform(ev_draw,0);
            x = x+view_xview[0];
            y = y+view_yview[0];
            //sprite_create_from_surface
            
        }
}
surface_reset_target();

instance_deactivate_all(true);
visible = true;





// Unpause
if (keyboard_check_pressed(ord('P')) == true && Input[PAUSE] = true)
        {
            Input[PAUSE] = false;
            instance_activate_all();
            instance_destroy();
        }

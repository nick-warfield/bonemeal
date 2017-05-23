if (place_meeting(x,y, Player02_obj))
    {
        instance_create(x,y, ENEMY_HERE);
        //audio_play_sound(,,); [this will be for when the creatures spawn in]
        instance_destroy();
    }


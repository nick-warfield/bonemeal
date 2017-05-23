if (!audio_is_playing(Crate_break_snd))
{
    audio_play_sound(Crate_break_snd, 30, false);
}

instance_create(x, y, Key_obj);


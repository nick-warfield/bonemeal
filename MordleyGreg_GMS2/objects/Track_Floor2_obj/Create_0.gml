if (!audio_is_playing(Main_trk))
{
    track = audio_play_sound(Main_trk, 75, true);
    audio_sound_gain(track, 0.2, 0);
}


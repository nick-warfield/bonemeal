
if (current_time >= timeStamp[2])       //big howl
{
    timeStamp[2] = current_time + random_range(21000, 35000);
    //timeStamp[3] = current_time + 1300;
    
    var bigHowl = audio_play_sound(Howl01_Ambient_snd, 20, false);
    audio_sound_gain(bigHowl, 0.4, 3000);
}

if (current_time >= timeStamp[3])        //lil' howlas
{
    var lilHowl = audio_play_sound(Howl02_Ambient_snd, 20, false);
    audio_sound_gain(lilHowl, .1, 1500);
    
    if (audio_is_playing(Howl01_Ambient_snd))
    { timeStamp[3] = current_time + random_range(2000, 3500); }
    else if (timeStamp[2] - 4000 > current_time)
    { timeStamp[3] = timeStamp[2] - random_range(2000, 4000); }
    else { timeStamp[3] = timeStamp[2] + 1300; }
}


if (current_time >= timeStamp[4])       //spoopy bat noises
{
    batty = audio_play_sound(Bat_Ambient_snd, 20, false);
    audio_sound_gain(batty, 0, 0);
    audio_sound_gain(batty, 0.6, 1000);
    //audio_sound_gain(batty, 0, 3000);
    
    timeStamp[5] = current_time + 1000;
    timeStamp[4] = current_time + random_range(10000, 30000);
}

if (current_time >= timeStamp[5])
{
    audio_sound_gain(batty, 0.4, 5000);
    timeStamp[5] = timeStamp[4];
}

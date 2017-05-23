action_fullscreen(2);
///Initialize Global Variables, and other stuff, then go to next room

global.paused = false;
global.scaleFactor = 1.5;
global.pauseBkg = 0;
global.oldRm = 0;

audio_set_master_gain(0, 0.75);

room_goto_next();


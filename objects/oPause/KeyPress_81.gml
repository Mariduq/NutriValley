if(!nutridex){
	pause = !pause;
}

if(pause && !nutridex){
	audio_play_sound(sndPauseOn, 1, false);
	//audio_pause_all();
} else if(!pause){
	surface_free(pauseSurface);
	//instance_activate_all();
	audio_resume_all();
	audio_play_sound(sndPauseOff, 1, false);
}
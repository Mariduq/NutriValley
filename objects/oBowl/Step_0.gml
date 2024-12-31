//text
if (place_meeting(x,y, oPlayer)) {
	
	//Play sound
	if (textfade == 0) {
		audio_play_sound(sndBowl,1,false);
	}
	textfade = textfade_max; //no fading: text fade stays high
} else {
	textfade = max(0, textfade-1); //reduce by 1 textfade until 0
	//if (textfade > 0 ) textfade--; es un codigo equivalente al de arriba
}
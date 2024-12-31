//if the mouse is hovering over the collision mask of our object
if (distance_to_point(mouse_x, mouse_y) <= 0) {
	
	if (!hover) audio_play_sound(sndButtonHover,1,false);
	
	hover = true;
	
	if (mouse_check_button_pressed(mb_any)) {
		
		audio_play_sound(sndButtonClick,1,false);
		
		initialize();
		if(file_exists("Save.sav")) {
			loadgame();
		}
		//there is no player in title room so we put 0 in xy
		fadeout(rTitle,0,0);
		
		//plays the background music
		audio_play_sound(sndMusic,1,true);
	}
	
} else {
	hover = false;
}





//if the mouse is hovering over the collision mask of our object
if (distance_to_point(mouse_x, mouse_y) <= 0) {
	
	if (!hover) audio_play_sound(sndButtonHover,1,false);
	
	hover = true;
	
	if (mouse_check_button_pressed(mb_any)) {
		
		audio_play_sound(sndButtonClick,1,false);
		
		if (!global.higher_jumps) {
			global.higher_jumps = true;
			text = on_text;
		} else {
			global.higher_jumps = false;
			text = off_text;
		}
		
		savegame();
	}
	
} else {
	hover = false;
}




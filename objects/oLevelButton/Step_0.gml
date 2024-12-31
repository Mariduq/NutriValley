// si se superaron los nivles anteriores este queda desbloqueado
if (desbloqueo <= global.level_win || global.unlock_levels) {

	//if the mouse is hovering over the collision mask of our object
	if (distance_to_point(mouse_x, mouse_y) <= 0) {
	
		if (!hover) audio_play_sound(sndButtonHover,1,false);
	
		hover = true;
	
		if (mouse_check_button_pressed(mb_any)) {
		
			audio_play_sound(sndButtonClick,1,false);
		
		
			//chequea si el nivel seleccionado es el que tiene checkpoint
			if (roomlevel == global.checkpoint_room) {
				
				fadeout(roomlevel, global.checkpoint_x, global.checkpoint_y);
		
			} else { //de no ser asi, se ubica al jugador en una posicion normal
				fadeout(roomlevel, default_x, default_y);
				global.def_x = default_x;
				global.def_y = default_y;
			}

		}
	
	} else {
		hover = false;
	}
}
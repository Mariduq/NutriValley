if (global.checkpoint_id = id) { 
	//si el global.checkpoint_id corresponde con el id de esta instancia el checkpoint se activa
	image_index = 1;
} else {
	//sino se queda desactivado
	image_index = 0;
	
	//si el jugador toca el checkpoint se le asignara el id de esta instancia a global.checkpoint_id
	if (place_meeting(x,y, oPlayer)) {
		global.checkpoint_room = room;
		global.checkpoint_x = x;
		global.checkpoint_y = y;
		global.checkpoint_id = id;
		
		savegame();
		savegamestuff();
		
		screenshake(5, 20);
		
		//play sound effect
		audio_play_sound(sndCheckpoint,1,false);

	}
	
}


//text
if (place_meeting(x,y, oPlayer)) {
	textfade = textfade_max; //no fading: text fade stays high
} else {
	textfade = max(0, textfade-1); //reduce by 1 textfade until 0
	//if (textfade > 0 ) textfade--; es un codigo equivalente al de arriba
}

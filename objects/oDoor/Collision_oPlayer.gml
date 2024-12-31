if (!oPause.pause) {

	if(global.allIngredients >= global.totalIngredients && image_index != 2 && oBowl.image_index == 2){
		image_speed = 0.05;
		if (!audio_is_playing(sndDoor)) {
			audio_play_sound(sndDoor,1,false);
		}
	}

	if (image_index == 2) {
	
		//si el jugador salta se sale del nivel
		if (keyboard_check_pressed(vk_up) || keyboard_check(ord("W"))) || keyboard_check(vk_space){
			global.checkpoint_room = rLevels;
			global.checkpoint_x = 160;
			global.checkpoint_y = 780;
			global.checkpoint_id = noone;
			if (nivel > global.level_win && !global.unlock_levels) {
				global.level_win = nivel;
			}
			fadeout(nextRoom, 0, 0);
			savegame();
			savegamestuff();
		}
	

	}
} else {
	image_speed = 0;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initialize(){
	
	global.level_win = 0;
	global.checkpoint_room = rLevels;
	//(445,485) es la posicion en la que aparecera el player por primera vez en rLevel, se puede modificar luego
	global.checkpoint_x = 160;
	global.checkpoint_y = 780;
	global.checkpoint_id = noone;
	global.lives = 5;
	global.target_x = global.checkpoint_x;
	global.target_y = global.checkpoint_y;
	
	//Ajustes
	global.invin_enemies = false;
	global.invin_hazards = false;
	global.infinite_jumps = false;
	global.higher_jumps = false;
	global.unlock_levels = false;
	global.fullscreen = false;
	
	window_set_fullscreen(false);
	
	//play music
	if (!audio_is_playing(sndMusic)) {
		audio_play_sound(sndMusic,1,true,-256.0);
	}

	//so we can use the mouse in the beginning
	window_set_cursor(cr_default);

}
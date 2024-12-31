// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadgame(){
	if (file_exists("Save.sav")) {
		ini_open("Save.sav");
		
		global.level_win = ini_read_real("Progress", "level_win", 0); //cuantos niveles a ganado
		global.checkpoint_x = ini_read_real("Progress", "x", 0);
		global.checkpoint_y = ini_read_real("Progress", "y", 0);
		global.checkpoint_room = ini_read_real("Progress", "Room", rLevel0);
		if(string_digits(string(room)) == string_digits(string(global.checkpoint_room))){
			if(instance_exists(oBowl)){
				oBowl.image_index = ini_read_real("Progress", "Bowl", 0);
			}
			if(instance_exists(oDoor)){
				oDoor.image_index = ini_read_real("Progress", "Door", 0);
			}
		}
		global.lives = ini_read_real("Progress", "Lives", 0);
		global.allIngredients = ini_read_real("Food", "Ingredients", 0);
		global.higher_jumps = ini_read_real("Difficulty", "higherjumps", false);
		global.infinite_jumps = ini_read_real("Difficulty", "infinitejumps", false);
		global.invin_enemies = ini_read_real("Difficulty", "invin_enemies", false);
		global.invin_hazards = ini_read_real("Difficulty", "invin_hazards", false);
		global.unlock_levels = ini_read_real("Difficulty", "unlock_levels", false);
		global.fullscreen = ini_read_real("Graphics", "fullscreen", false);
		
		
		if (window_get_fullscreen() != global.fullscreen) {
			window_set_fullscreen(global.fullscreen);
		}
		
		ini_close();
	}
}
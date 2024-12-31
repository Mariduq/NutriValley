// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function savegame(){
	if (file_exists("Save.sav")) {
		file_delete("Save.sav");
	}
	
	ini_open("Save.sav");
	//(seccion, name of the value, value assigned)
	ini_write_real("Progress", "level_win", global.level_win); //que niveles a ganado
	ini_write_real("Progress", "Room", global.checkpoint_room);
	ini_write_real("Progress", "x", global.checkpoint_x);
	ini_write_real("Progress", "y", global.checkpoint_y);
	
	if(variable_global_exists("lives")){
		ini_write_real("Progress", "Lives", global.lives);
	}
	if (instance_exists(oBowl)){
	    ini_write_real("Progress", "Bowl", oBowl.image_index);
	}
	if (instance_exists(oDoor)){
	    ini_write_real("Progress", "Door", oDoor.image_index);
	}
	if(variable_global_exists("allIngredients")){
		ini_write_real("Food", "Ingredients", global.allIngredients);
	}
	ini_write_real("Difficulty", "higherjumps", global.higher_jumps);
	ini_write_real("Difficulty", "infinitejumps", global.infinite_jumps);
	ini_write_real("Difficulty", "invin_enemies", global.invin_enemies);
	ini_write_real("Difficulty", "invin_hazards", global.invin_hazards);
	ini_write_real("Difficulty", "unlock_levels", global.unlock_levels);
	ini_write_real("Graphics", "fullscreen", global.fullscreen);
	ini_close();
	
	
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function death(){
	global.lives--;
	
	if(global.lives != 0){
		if(string_digits(string(room)) != string_digits(string(global.checkpoint_room))){
			fadeout(room, global.def_x, global.def_y);
		} else{
			if(!file_exists("Save.sav")) {
				fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
			} else {
				ini_open("Save.sav");
				ini_write_real("Progress", "Lives", global.lives);
				ini_close();
				loadgame();
				fadeout(global.checkpoint_room, global.checkpoint_x, global.checkpoint_y);
			}
		}
	} else{
		global.checkpoint_room = rLevels;
		global.checkpoint_x = 160;
		global.checkpoint_y = 780;
		global.checkpoint_id = noone;
		global.lives = 5;
		fadeout(rTitle, 0, 0);
	}
	
	instance_create_layer(x,y,"Player", oExplode);
	
	screenshake(12,60);
	
		//play sound effect
	if (!audio_is_playing(sndDeath)) {
		audio_play_sound(sndDeath,1,false);
	}
	
	instance_destroy();
}
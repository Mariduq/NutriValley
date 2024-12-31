// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function roomcode(){
	
	fadein();
	
	if(!instance_exists(oNutridex)){
		instance_create_layer(global.target_x, global.target_y, "Nutridex", oNutridex);
	}
	
	//cada vez que creementos un rLevel1 esto chequeara si el Player existe
	if (!instance_exists(oPlayer)) {
		//si no existe el player se crea y se posiciona en las cordinadas del ultimo checkpoint activo
		instance_create_layer(global.target_x, global.target_y, "Player", oPlayer);
		instance_create_layer(global.target_x, global.target_y, "Weapon", oGun);
	}
	
	if(!instance_exists(oLevelManager)){
		instance_create_layer(global.target_x, global.target_y, "Blocks", oLevelManager);
		oLevelManager.required_nutrients[? "protein"] = 100;
		oLevelManager.required_nutrients[? "fat"] = 100;
		oLevelManager.required_nutrients[? "carbohydrate"] = 100;
		oLevelManager.required_nutrients[? "water"] = 100;
	}
	
	if (!instance_exists(oCamera)) {
		instance_create_layer(global.target_x,global.target_y, "Player", oCamera);
	}
	
	if(!instance_exists(oPause)){
		instance_create_layer(global.target_x, global.target_y, "Player", oPause);
	}
	
	//play music
	if (!audio_is_playing(sndMusic)) {
		audio_play_sound(sndMusic,1,true);
	}
	
	loadgamestuff();
	
	if(array_length(oPlayer.deletedItems) > 0){
		for(var i = 0; i < array_length(oPlayer.deletedItems); i++){
			instance_destroy(oPlayer.deletedItems[i]);
		}
	}
	
	//after we get to a level this turns off the mouse because we don't use it in the game
	//window_set_cursor(cr_none);
	
}
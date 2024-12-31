function loadNew(){
	file_delete("Save.sav");
	file_delete("nutridexImages.txt");
	file_delete("nutridexItems.txt");
	file_delete("deletedItems.txt");
	file_delete("inventory.txt");
	file_delete("nutrientKeys.txt");
	file_delete("nutrientValues.txt");
	initialize();
	fadeout(rLevels, 0, 0);
}

//if the mouse is hovering over the collision mask of our object
if (distance_to_point(mouse_x, mouse_y) <= 0) {
	
	if (!hover) audio_play_sound(sndButtonHover,1,false);
	
	hover = true;
	
	if (mouse_check_button_pressed(mb_any)) {
		
		audio_play_sound(sndButtonClick,1,false);
		
		if(file_exists("Save.sav")) {
			menu(
				x1,
				y1,
				[
					["Sí", loadNew],
					["No", ]
				],
				"¿Borrar partida anterior?"
			);
			global.deactiveObject = oButtonDeleteSave;
		} else{
			loadNew();
		}
	}
	
} else {
	hover = false;
}



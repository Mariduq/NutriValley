if(pause && !nutridex){
	nutridex = false;
	if (keyboard_check_pressed(vk_escape)){
		audio_play_sound(sndButtonClick, 1, false);
		surface_free(pauseSurface);
		pause = false;
		fadeout(rTitle, 0, 0);
	}
	if (keyboard_check_pressed(ord("E"))){
		audio_play_sound(sndButtonClick, 1, false);
		nutridex = true;
	}
} else if(nutridex){
	if (keyboard_check_pressed(ord("E"))){
		audio_play_sound(sndButtonClick, 1, false);
		nutridex = false;
	}

	size = array_length(oNutridex.nutridexItems);
	allPages = floor(size/totalSize);
	if(keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))){
		//if(allPages % 6 != 0){
		if((keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) && pageCount < size-totalSize){
			actualPage++;
			//pageCount = pageCount + (6 * allPages);
			pageCount += 6;
		} else if((keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) && pageCount > 0){
			actualPage--;
			//pageCount = pageCount - (6 * allPages);
			pageCount -= 6;
		}
		//}
	}
	
}
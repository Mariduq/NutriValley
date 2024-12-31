// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function savegamestuff(){
	if (file_exists("nutridexImages.txt")){
		file_delete("nutridexImages.txt");
	}
	if (file_exists("nutridexItems.txt")){
		file_delete("nutridexItems.txt");
	}
	if (file_exists("deletedItems.txt")){
		file_delete("deletedItems.txt");
	}
	if(file_exists("inventory.txt")){
		file_delete("inventory.txt");
	}
	if(file_exists("nutrientsKeys.txt")){
		file_delete("nutrientsKeys.txt");
	}
	if(file_exists("nutrientsValues.txt")){
		file_delete("nutrientsValues.txt");
	}
   
	// Open a file for writing
	var file = file_text_open_write("nutridexImages.txt");
   
	// Write each item to the file
	for (var i = 0; i < array_length(oNutridex.nutridexImages); i++) {
	    file_text_write_real(file, oNutridex.nutridexImages[i]);
	    file_text_writeln(file); // Write a newline character
	}
   
	// Close the file
	file_text_close(file);
   
	// Open a file for writing
	file = file_text_open_write("nutridexItems.txt");
   
	// Write each item to the file
	for (var i = 0; i < array_length(oNutridex.nutridexItems); i++) {
	    file_text_write_string(file, oNutridex.nutridexItems[i]);
	    file_text_writeln(file); // Write a newline character
	}
   
	// Close the file
	file_text_close(file);
   
	file = file_text_open_write("deletedItems.txt");
   
	// Write each item to the file
	for (var i = 0; i < array_length(oPlayer.deletedItems); i++) {
	    file_text_write_real(file, oPlayer.deletedItems[i]);
	    file_text_writeln(file); // Write a newline character
	}
   
	// Close the file
	file_text_close(file);
	
	file = file_text_open_write("inventory.txt");
	
	for(var i = 0; i < array_length(global.instanceID); i++){
		file_text_write_real(file, global.instanceID[i]);
	    file_text_writeln(file); // Write a newline character
	}
	
	file_text_close(file);
	
	var keys = ds_map_keys_to_array(oLevelManager.collected_nutrients);
	var values = ds_map_values_to_array(oLevelManager.collected_nutrients);

	file = file_text_open_write("nutrientKeys.txt");
	
	for(var i = 0; i < array_length(keys); i++){
		file_text_write_string(file, keys[i]);
	    file_text_writeln(file); // Write a newline character
	}
	
	file_text_close(file);
	
	file = file_text_open_write("nutrientValues.txt");
	
	for(var i = 0; i < array_length(values); i++){
		file_text_write_string(file, values[i]);
	    file_text_writeln(file); // Write a newline character
	}
	
	file_text_close(file);
}
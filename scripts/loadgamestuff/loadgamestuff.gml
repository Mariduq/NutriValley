// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function loadgamestuff(){
	// Open the file for reading
	if (file_exists("nutridexImages.txt")) {
	    var file = file_text_open_read("nutridexImages.txt");
       
	    // Clear the existing inventory
	    oNutridex.nutridexImages = [];
       
	    // Read each line from the file
	    while (!file_text_eof(file)) {
	        var item = file_text_read_real(file);
	        array_push(oNutridex.nutridexImages, item);
	        file_text_readln(file); // Move to the next line
	    }
       
	    // Close the file
	    file_text_close(file);
	} 
   
	if (file_exists("nutridexItems.txt")) {
	    file = file_text_open_read("nutridexItems.txt");
       
	    // Clear the existing inventory
	    oNutridex.nutridexItems = [];
       
	    // Read each line from the file
	    while (!file_text_eof(file)) {
	        item = file_text_read_string(file);
	        array_push(oNutridex.nutridexItems, item);
	        file_text_readln(file); // Move to the next line
	    }
       
	    // Close the file
	    file_text_close(file);
	}
   
	if (file_exists("deletedItems.txt")) {
	    file = file_text_open_read("deletedItems.txt");
       
	    // Clear the existing inventory
	    oPlayer.deletedItems = [];
	   
		if(string_digits(string(room)) == string_digits(string(global.checkpoint_room))){
			// Read each line from the file
			while (!file_text_eof(file)) {
				item = file_text_read_real(file);
				array_push(oPlayer.deletedItems, item);
				file_text_readln(file); // Move to the next line
			}
		}
       
	    // Close the file
	    file_text_close(file);
	}
	
	ds_map_clear(oPlayer.inventory);
	oPlayer.inventoryItems = [];
	global.instanceID = [];
	
	if (file_exists("inventory.txt")) {
		if(string_digits(string(room)) == string_digits(string(global.checkpoint_room))){
			file = file_text_open_read("inventory.txt");
			while (!file_text_eof(file)) {
		        item = file_text_read_real(file);
		        array_push(global.instanceID, item);
		        file_text_readln(file); // Move to the next line
		    }
			for(var i = 0; i < instance_count; i++){
				if(layer_has_instance("Items", instance_id_get(i))){
					var temp_id = instance_id_get(i);
					with(temp_id){
						for(var j = 0; j < array_length(global.instanceID); j++){
							if(ID == global.instanceID[j]){
								var key = temp_id.object_index;
								var value = 1;
								if (ds_map_exists(oPlayer.inventory, key)) {
									value += ds_map_find_value(oPlayer.inventory, key);
									//reemplaza el valor anterior por el actual
									ds_map_replace(oPlayer.inventory, key, value);
								} else {
									//agregamos el item al inventario
									ds_map_add(oPlayer.inventory, key, value);
									array_push(oPlayer.inventoryItems, key);
								}
							}
						}
					}
				}
			}
			file_text_close(file);
		}
	}
	
	if(file_exists("nutrientKeys.txt") && file_exists("nutrientValues.txt")){
		if(string_digits(string(room)) == string_digits(string(global.checkpoint_room))){
			ds_map_clear(oLevelManager.collected_nutrients);
			var keys = [];
			var values = [];
			
			file = file_text_open_read("nutrientKeys.txt");
			while (!file_text_eof(file)) {
		        item = file_text_read_string(file);
		        array_push(keys, item);
		        file_text_readln(file); // Move to the next line
		    }
			file_text_close(file);
			
			file = file_text_open_read("nutrientValues.txt");
			while (!file_text_eof(file)) {
		        item = file_text_read_real(file);
		        array_push(values, item);
		        file_text_readln(file); // Move to the next line
		    }
			file_text_close(file);
			for(var i = 0; i < array_length(keys); i++){
				ds_map_add(oLevelManager.collected_nutrients, keys[i], values[i]);
			}
		}
		//show_debug_message(string(keys));
		//show_debug_message(string(values));
	}
}
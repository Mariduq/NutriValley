/// @description Colision con items
global.allIngredients++;
if (!audio_is_playing(sndPickObject)) {
	audio_play_sound(sndPickObject,1,false);
}

//obtiene el index del item con el que colisionamos
var key = other.object_index;

//cantidad de objetos recogidos
var value = 1;

array_push(global.instanceID, other.ID);
//si este item ya se ha conseguido antes, se suma
if (ds_map_exists(inventory, key)) {
	
	value += ds_map_find_value(inventory, key);
	//reemplaza el valor anterior por el actual
	ds_map_replace(inventory, key, value);
	
} else {
	//agregamos el item al inventario
	ds_map_add(inventory, key, value);
	
	//agregamos key a inventoryItems
	//ds_list_add(inventoryItems, key);
	array_push(inventoryItems, key);
	//ds_list_add(oNutridex.nutridexItems, other.info);
	//ds_list_add(oNutridex.nutridexImages, key);
	if(!array_contains(oNutridex.nutridexItems, other.info)){
		array_push(oNutridex.nutridexItems, other.info);
		array_push(oNutridex.nutridexImages, key);
	}
}

// comprobamos si el item tiene definida la funcion collected

if (variable_instance_exists(other, "collected") && is_method(other.collected)) {
	//show_debug_message("collected method found");
	other.collected();
} 
//else {
//	show_debug_message("no collected method found");
//}

//var inv = ds_map_values_to_array(inventory);
//show_debug_message(string(inv));

array_push(deletedItems, other);
instance_destroy(other);

//mensaje (quitar luego)
//show_message("Key: " + string(key) + " Value: " + string(ds_map_find_value(inventory, key)));
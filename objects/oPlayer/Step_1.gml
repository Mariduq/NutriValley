/// @description Chequeo interaccion con inventario

disableObjectTimer -= 1;

if (disableObjectTimer < 0 && activeObject != -1) {
	disableObjectTimer = 0;
	activeObject = -1;
}

if (showInventory) {
	// get camera position

	var cam = view_camera[0];
	var camX = camera_get_view_x(cam);
	var camY = camera_get_view_y(cam);

	var mx = mouse_x - camX;
	var my = mouse_y - camY;

	// show_debug_message("camera X: " + string(camX) + " camera Y: " + string(camY) + " mouse X: " + string(mx) + " mouse Y: " + string(my) + " raw mouse X: " + string(mouse_x) + " raw mouse Y: " + string(mouse_y) )
	// show_debug_message("Checking inventory")

	var len = array_length(inventoryItems);
	var itemsY = ITEMS_Y - 32;

	if (mx > ITEMS_X && mx < ITEMS_X + ITEM_W && my > itemsY && my < itemsY + ITEM_H * len) {
		for (var i = 0; i < len; i++) {
			if (my > itemsY && my < itemsY + ITEM_H) {
				var key = inventoryItems[i];
				var value = ds_map_find_value(inventory, key);

				// show_debug_message("Item: " + string(key) + " Value: " + string(value));
				highlighted = key;
				if (mouse_check_button_pressed(mb_left)) {

					activeObject = key;
					disableObjectTimer = 30;
					showInventory = false;

				}
				break;
			}
			itemsY += ITEM_H;
		}
	} else {
		highlighted = -1;
	}




}
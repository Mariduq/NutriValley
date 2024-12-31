/// @description

#region inventory
	if(showInventory) {
		//cantidad de items
		var len = array_length(inventoryItems);
		
		//this number is the size of the grid in the rooms

		var MENU_X = GRID * 0.5;
		var MENU_Y = GRID * 0.5;
		var MENU_W = GRID * 3;
		var MENU_H = GRID * (len + 1.2);
	
		draw_sprite_stretched(sMenuBox,0, MENU_X, MENU_Y, MENU_W, MENU_H);
	
		draw_set_color(c_white);
		draw_text(2 + GRID*(2), GRID, "Inventario");
		
		var itemsY = ITEMS_Y

		for (var i = 0; i < len; i++) {
			//id y valor del item
			var key = inventoryItems[i];
			var value = ds_map_find_value(inventory, key);

			if (highlighted == key) {
				draw_set_color(c_white);
				draw_rectangle(ITEMS_X - 32, itemsY - 32, ITEMS_X + ITEM_W - 32, itemsY + ITEM_H - 32, false);
				draw_set_color(c_black);
			}
		
			draw_text(ITEMS_X + GRID, itemsY, ": " + string(value));
			//dibuja el item
			draw_set_color(c_white);
			draw_sprite(
				object_get_sprite(key),
				0,
				ITEMS_X,
				itemsY
			);
			itemsY += ITEM_H;
		}


	}
#endregion

#region lives
	if (!oPause.pause) {
		draw_set_font(fDefault);
		draw_sprite_stretched(sMenuBox,0,GRID * 11.5, GRID/2, GRID * 2,GRID);
		draw_set_color(c_white);
		draw_sprite_ext(sLive, 0, GRID * 11.5 + GRID/2, GRID, lifeImageScale, 1, 0, -1, 1);
		draw_text(GRID * 12.25 + GRID/2, GRID, ": "+string(global.lives));
	}
#endregion
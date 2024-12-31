/// @description

//Para que el player siga apareciendo en la pantalla
draw_self();
#region inventory
	if(showInventory) {
	
		//cantidad de items
		var len = array_length(inventoryItems);
	
		//obtenemos posiciones xy de acuerdo a la camara
		var cam = camera_get_active();
		var camX = camera_get_view_x(cam);
		var camY = camera_get_view_y(cam);
	
		//this number is the size of the grid in the rooms
		var GRID = 64;
	
		//draw_rectangle(camX + GRID/2, camY + GRID/2, camX + GRID * 4, camY + GRID * (len+2), 0);
		

		draw_sprite_stretched(sMenuBox,0,camX + GRID/2, camY + GRID/2, GRID * 4, GRID * (len+1.2));

	
		draw_set_color(c_white);
		draw_text(camX + 2 + GRID*(2.5), camY + GRID, "Inventario");
	
	
		//loop para dibujar los items
		for (var i = 0; i < len; i++) {
		
			//id y valor del item
			var key = array_get(inventoryItems, i);
			var value = ds_map_find_value(inventory, key);
		
			//dibuja el item
			draw_sprite(object_get_sprite(key), 0, camX + GRID*2, camY + ((i+2) * GRID));
			draw_text(camX + (GRID *3), camY + ((i+2) * GRID), ": " + string(value));
			
			
		}
	}
#endregion

#region lives

	var cam = camera_get_active();
	var camX = camera_get_view_x(cam);
	var camY = camera_get_view_y(cam);
	
	var GRID = 64;
	
	draw_set_font(fDefault);
	
	draw_sprite_stretched(sMenuBox,0,camX + GRID * 12.75, camY + GRID/2, GRID * 2,GRID);
	
	draw_set_color(c_white);
	//draw_rectangle(camX + GRID * 5.5, camY, camX + GRID * 7.5, camY + GRID, 0);
	
	draw_sprite_ext(sLive, 0, camX + GRID * 12.75 + GRID/2, camY + GRID, lifeImageScale, 1, 0, -1, 1);
	//draw_sprite(sLive, 0, camX + GRID * 12.5 + GRID/2, camY + GRID);
	
	draw_text(camX + GRID * 13.5 + GRID/2, camY + GRID, ": "+string(global.lives));
	//draw_text_color(camX + GRID * 6.5 + GRID/2, camY + GRID/2, ": "+string(global.lives), c_dkgray, c_black, c_dkgray, c_black, 1);

#endregion
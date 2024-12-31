if(pause){
	if(!surface_exists(pauseSurface)){
		var _vx = camera_get_view_x(view_camera[0]);
		var _vy = camera_get_view_y(view_camera[0]);
		pauseSurface = surface_create(_vx, _vy);
		surface_set_target(pauseSurface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		draw_surface(pauseSurface, 0, 0);
		oPlayer.showInventory = false;
		//instance_deactivate_all(true);
	}
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_font(fPauseTitle);
	//obtenemos posiciones xy de acuerdo a la camara
	var cam = camera_get_active();
	var camX = camera_get_view_x(cam);
	var camY = camera_get_view_y(cam);
	var camWidth = camera_get_view_width(cam);
	var camHeight = camera_get_view_height(cam);
	
	var GRID = 64;

	var ITEMS_X = GRID * 1.25;
	var ITEMS_Y = GRID * 1.5;

	// Card del nutridex
	var CARD_W = GRID * 3.5;
	var CARD_H = GRID * 4;
	var CARD_X_GAP = GRID * 0.5;
	var CARD_Y_GAP = GRID * 0.25;

	// Relativo al card
	var SPRITE_X = GRID * 1.75;
	var SPRITE_Y = GRID * 0.75;
	var TEXT_X = CARD_W/2; // centrado
	var TEXT_Y = GRID * 2.25; // centrado
	var BUTTON_W = GRID * 2.5;
	var BUTTON_H = GRID * 0.5;
	var BUTTON_X = CARD_W/2 - BUTTON_W/2;
	var BUTTON_Y = GRID * 2.75;
	
	if(!nutridex){
		draw_sprite_stretched(sMenuBox,0,camX + GRID * 3, camY + GRID * 3, GRID * 8.5, GRID * 4);
		//draw_rectangle_color(camX + GRID*12, camY + GRID*7.5, camX + GRID * 3, camY + GRID * 3, c_ltgrey, c_green, c_ltgrey, c_green, 0);
	
		draw_set_color(c_white);
		draw_text(camX + 2 + GRID*7.2, camY + GRID*4, "Menú de Pausa");
		//draw_text_color(camX + 2 + GRID*7.5, camY + GRID*4, "Menú de Pausa", c_dkgrey, c_white, c_dkgrey, c_black, 1);
	
		draw_set_font(fDefault);
		draw_text(camX  + 2 + GRID*7.2, camY + GRID*5.5, "Presione la tecla \"Q\" para reanudar.");
		draw_text(camX + 2 + GRID*7.2, camY + GRID*6, "Presione la tecla \"E\" para ver la Nutridex.");
		draw_text(camX + 2 + GRID*7.2, camY + GRID*6.5, "Presione la tecla \"ESC\" para salir.");
		
		//draw_text_color(camX + 2 + GRID*7.5, camY + GRID*5.5, "Presione la tecla \"ESPACIO\" para resumir.", c_dkgrey, c_white, c_dkgrey, c_black, 1);
		//draw_text_color(camX + 2 + GRID*7.5, camY + GRID*6, "Presione la tecla \"E\" para ver la Nutridex.", c_dkgrey, c_white, c_dkgrey, c_black, 1);
		//draw_text_color(camX + 2 + GRID*7.5, camY + GRID*6.5, "Presione la tecla \"ESC\" para salir.", c_dkgrey, c_white, c_dkgrey, c_black, 1);
	} else{
		//if(global.fullscreen){
			draw_sprite_stretched(sMenuBoxDarker,0,camX + GRID/2, camY + GRID/2, 836, 640);
		//} else{
			//draw_sprite_stretched(sMenuBox,0,camX + GRID/2, camY + GRID/2, camWidth - GRID, camHeight - GRID);
		//}
		//show_debug_message(string(camX));
		//show_debug_message(string(camY));
		//show_debug_message(string(camWidth));
		//show_debug_message(string(camHeight));
		//draw_rectangle_color(camX, camY, camWidth, camHeight, c_yellow, c_gray, c_yellow, c_gray, 0);
		
		draw_set_color(c_white);
		draw_text(camX + 2 + GRID*7, camY + GRID, "Nutridex");
		//draw_text_color(camX + 2 + GRID*7, camY + GRID, "Nutridex", c_dkgrey, c_black, c_dkgrey, c_black, 1);
		draw_set_font(fDefault);
		draw_text(camX + 2 + GRID*7, camY + GRID*10.25, "Pulsa la tecla \"E\" para salir de la Nutridex.");
		//draw_text_color(camX + 2 + GRID*7, camY + GRID*10.5, "Pulsa la tecla \"E\" para salir de la Nutridex.", c_dkgrey, c_black, c_dkgrey, c_black, 1);
		
		var size = array_length(oNutridex.nutridexItems);
		var key = 0;
		if(size == 0){
			draw_set_font(fPauseTitle);
			draw_text(camX + 2 + GRID*7, camY + GRID*5, "¡La Nutridex está vacía!");
			//draw_text_color(camX + 2 + GRID*7, camY + GRID*5, "¡La Nutridex está vacía!", c_dkgrey, c_black, c_dkgrey, c_black, 1);
		} else{
			draw_set_font(fDefault);
			if(size > 6){
				
				if(size == 12 || size == 18 || size == 24 || size == 30 || size == 36 || size == 42 || size == 48 || size == 54 || size == 60){
					draw_text(camX + 2 + GRID*11.5, camY + GRID, "Página "+string(actualPage+1)+" de "+string(allPages));
				} else{
					draw_text(camX + 2 + GRID*11.5, camY + GRID, "Página "+string(actualPage+1)+" de "+string(allPages+1));
				}
				draw_text(camX + 2 + GRID*7, camY + GRID*9.75, "Pulsa las teclas izquierda (A) o derecha (D) para cambiar de página.");
				
				//draw_text_color(camX + 2 + GRID*11.5, camY + GRID/2, "Página "+string(actualPage+1)+" de "+string(allPages+1)+".", c_dkgrey, c_black, c_dkgrey, c_black, 1);
				//draw_text_color(camX + 2 + GRID*7, camY + GRID*10, "Pulsa las teclas izquierda (A) o derecha (D) para cambiar de página.", c_dkgrey, c_black, c_dkgrey, c_black, 1);
			}
			for(var i = 0 + pageCount; i < array_length(oNutridex.nutridexItems); i++){
				draw_set_font(fNutridex);
				if(i==0 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID *1.25, camY + GRID *1.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0, camX + GRID * 3, camY + GRID * 2.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 3, camY + GRID * 3.95, key, 11, 170);
					
				} else if(i==1 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID * 5.25, camY + GRID * 1.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0,  camX + GRID * 7, camY + GRID * 2.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 7, camY + GRID * 3.95, key, 11, 170);
					
				} else if(i==2 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID * 9.25, camY + GRID * 1.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0, camX + GRID * 11, camY + GRID * 2.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 11, camY + GRID * 3.95, key, 11, 170);
					
				} else if(i==3 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID * 1.25, camY + GRID * 5.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0, camX + GRID * 3, camY + GRID * 6.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 3, camY + GRID * 7.95, key, 11, 170);
					
				} else if(i==4 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID * 5.25, camY + GRID * 5.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0, camX + GRID * 7, camY + GRID * 6.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 7, camY + GRID * 7.95, key, 11, 170);
					
				} else if(i==5 + pageCount){
					
					draw_sprite(sCard, 0, camX + GRID * 9.25, camY + GRID * 5.5);
					//key = ds_list_find_value(oNutridex.nutridexImages, i);
					key = oNutridex.nutridexImages[i];
					draw_sprite(object_get_sprite(key), 0, camX + GRID * 11, camY + GRID * 6.25);
					//key = ds_list_find_value(oNutridex.nutridexItems, i);
					key = oNutridex.nutridexItems[i];
					draw_text_ext(camX + GRID * 11, camY + GRID * 7.95, key, 11, 170);
					
				}

				draw_set_color(c_white);
			}
		}
	}
}
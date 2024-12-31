/// @description Se dibujan las barras para cada categoria utilizando bar_sizes

var cam = camera_get_active();
var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);
var camWidth = camera_get_view_width(cam);
var camHeight = camera_get_view_height(cam);

draw_set_color(c_black)
//draw_set_alpha(0.5);
//draw_rectangle(camX + 30, camY + 32, camX + 267, camY + 302, false);
//draw_set_alpha(1);

if (!oPause.pause) {
	if(instance_exists(oPlayer)){
		if(oPlayer.showInventory == false){
			draw_sprite_stretched(sMenuBox,0, camX + 30, camY + 32, camX + 240, camY + 190);
		} else{
			draw_sprite_stretched(sMenuBox,0, camX + 330, camY + 32, camX + 240, camY + 190);
		}
	} else{
		draw_sprite_stretched(sMenuBox,0, camX + 30, camY + 32, camX + 240, camY + 190);
	}

	draw_bar("protein", #4042FF, 70);
	draw_bar("fat", #FF4440, 110);
	draw_bar("carbohydrate", c_orange, 150);
	//draw_bar("vitamins", c_yellow, 120);
	//draw_bar("minerals", c_orange, 150);
	draw_bar("water", #40FFD3, 190);
	//draw_bar("fiber", c_maroon, 210);

	draw_set_color(c_white);
	draw_set_alpha(1.0);
}
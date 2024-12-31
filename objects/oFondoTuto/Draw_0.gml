/// @description Insert description here
// You can write your code in this editor

//obtenemos posiciones xy de acuerdo a la camara
var cam = camera_get_active();
var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);

draw_sprite_ext(sFondoTuto, 0, camX, camY, 10, 10, 0, -1, 1);

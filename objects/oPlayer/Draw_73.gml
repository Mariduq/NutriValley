/// @description Dibujar objeto activo

if (activeObject != -1) {
  var spr = object_get_sprite(activeObject);
  draw_sprite_ext(spr, 0, x + (10 * image_xscale), y - 2, 0.5, 0.5, 0, c_white, 1.0);
}
off_text = "OFF";
on_text = "ON";

if(!global.invin_enemies) {
	text = off_text;
} else {
	text = on_text;
}

explain = "INVENCIBILIDAD A Enemigos:\nActiva esta opción si no quieres\nque los enemigos te hagan daño.";

//top left corner of button
x1 = x-(sprite_width/2);
y1 = y-(sprite_height/2);

//button right corner of button
x2 = x+(sprite_width/2);
y2 = y+(sprite_height/2);

hover = false;
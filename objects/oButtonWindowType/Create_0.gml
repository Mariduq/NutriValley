off_text = "OFF";
on_text = "ON";

if(!global.fullscreen) {
	text = off_text;
} else {
	text = on_text;
}

explain = "PANTALLA COMPLETA:\nActiva esta opción para ver el juego\nen pantalla completa.";

//top left corner of button
x1 = x-(sprite_width/2);
y1 = y-(sprite_height/2);

//button right corner of button
x2 = x+(sprite_width/2);
y2 = y+(sprite_height/2);

hover = false;
off_text = "OFF";
on_text = "ON";

if(!global.unlock_levels) {
	text = off_text;
} else {
	text = on_text;
}

explain = "NIVELES DESBLOQUEADOS:\nActiva esta opción si quieres\nque los niveles esten desbloqueados.";

//top left corner of button
x1 = x-(sprite_width/2);
y1 = y-(sprite_height/2);

//button right corner of button
x2 = x+(sprite_width/2);
y2 = y+(sprite_height/2);

hover = false;
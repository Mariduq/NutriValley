off_text = "OFF";
on_text = "ON";

if(!global.infinite_jumps) {
	text = off_text;
} else {
	text = on_text;
}

explain = "SALTOS ILIMITADOS:\nActiva esta opción si\nquieres saltar en el aire.";

//top left corner of button
x1 = x-(sprite_width/2);
y1 = y-(sprite_height/2);

//button right corner of button
x2 = x+(sprite_width/2);
y2 = y+(sprite_height/2);

hover = false;
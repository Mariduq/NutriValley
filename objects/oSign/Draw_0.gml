//when we draw something in the draw event it overwrites the sprite
draw_self(); // draws the sprite again

draw_set_font(fDefault);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if (textfade > 0) {
	//draw_set_alpha goes from 0 to 1 so it acts as a %
	draw_set_alpha(textfade/textfade_max); //this division will always give a number inside that range
	draw_set_color(c_aqua);
	
	
	var boxx = x - string_width(text)/2 - buff;
	var boxy = y-text_y -(string_height(text)/2);

	draw_sprite_stretched(sMenuBox,0,boxx,boxy,string_width(text)+ buff*2,string_height(text));


	//drawing the text
	draw_set_color(c_white);
	draw_text(x, y-text_y,text);
}

draw_set_alpha(1); //make everything else not fade
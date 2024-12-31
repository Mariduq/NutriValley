//since we don't want this sprite to be seen, we don't use draw self

//Button Text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fButtons);

// si se superaron los nivles anteriores este queda desbloqueado



if (desbloqueo <= global.level_win || global.unlock_levels) {
	if (!hover) {
		draw_set_color(c_white);
		draw_rectangle(x1,y1,x2,y2,true);
		draw_text(x,y, texto);
	} else {
		draw_set_color(c_white);
		draw_rectangle(x1,y1,x2,y2,false);
		draw_set_color(c_black);
		draw_text(x,y, texto);
	}
} else {
	draw_set_color(c_dkgray);
	draw_rectangle(x1,y1,x2,y2,true);
	draw_text(x,y, texto);
}

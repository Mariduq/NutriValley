if (fade_out) { //FADE OUT from clear to black
	if (a < 1) { //if not completely black
		a += fadeoutrate; //make more black
	} else {
		a = 1; //set to 100% black
		if (target_room != noone) {
			room_goto(target_room);
		}
	}
} else { //FADE IN from black to clear
	if (a > 0) { //if not completely clear
		a -= fadeinrate; //make more clear
	} else {
		a = 0; //set to 0% black
		instance_destroy();
	}
}





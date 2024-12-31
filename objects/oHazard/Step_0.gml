if (!global.invin_hazards) {
	//Game Over
	if (place_meeting(x,y, oPlayer)) {
		with (oPlayer) {
			death();
		}
	}
}

// si el juego esta en pausa, detener animacion
if(oPause.pause) {
	image_speed = 0;
} else {
	image_speed = 1;
}





if (!oPause.pause) {
	y = startY + (sin(current_time/500) * waveHeight);
	speed = hsp;
	
} else { //si el juego esta en pausa, no moverse
	speed = 0;
}
//if(image_angle == 1){
//	image_angle = 360;
//} else{
//	image_angle -= 15;
//}


if (!global.invin_enemies) {
	//Game Over
	if (place_meeting(x,y, oPlayer)) {
		with (oPlayer) {
			death();
		}
	}
}

if (place_meeting(x,y,oBullet)) {
	instance_create_layer(x,y,"Bad", oExplode);
	instance_destroy();
	instance_destroy(oBullet);
}
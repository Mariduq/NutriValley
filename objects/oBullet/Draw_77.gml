//this event occurs after everything has been drawn

//si la pausa esta activada la bala no se movera
if (oPause.pause) {
	speed = 0;
} else {
	speed = 25;
}

//if the bullet touches a block or an enemy it disappears
if (place_meeting(x, y, oBlock) || place_meeting(x, y, oPillar)){
	instance_destroy();
}
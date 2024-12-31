//end step means that after all the step events of all the objets have run, then this will run

//if Player exist, the weapon will follow it
if (instance_exists(oPlayer)) {
	
	x = oPlayer.x;
	y = oPlayer.y+3; //weapon goes down a little bit
	visible = oPlayer.activeObject == -1;
	
	//firingdelay
	firingdelay = firingdelay - 1;
	if ((mouse_check_button(mb_left) || mouse_check_button(mb_right)) && (firingdelay < 0) && oPlayer.activeObject == -1 && !oPause.pause) {
		firingdelay = 14;
		with (instance_create_layer(x, y, "Bullets", oBullet)) {
			//velocidad a la que iran las ballas
			speed = 25;
		
			//direccion de las balas es la misma que el angulo de oGun
			direction = other.image_angle; //other se refiere al objeto afuera del with statement (en este caso oGun)
		
			//para que la imagen de la bala este en la misma direccion que el disparo
			image_angle = direction;
		
			screenshake(2, 10);
		
			//play sound effect
			audio_play_sound(sndAttack,1,false);
		}
	}
	
	if (!oPause.pause) {
		//modifica el  angulo de la imagen sGun
		image_angle = point_direction(x, y, mouse_x, mouse_y);

		// voltea la pistola al apuntar a la izquierda
		if (image_angle > 90 && image_angle < 270) {
			image_yscale = -1;
		} else {
			image_yscale = 1;
		}
	}

} else { //if Player object doesn't exist it will delete the weapon object
	instance_destroy();
}



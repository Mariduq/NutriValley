if (!oPause.pause) { //si el juego no esta en pausa
	
	var collWall = collision_point(x, y+2, oPillar, 0, 0);

	if(collWall != noone){
		gravity = 0;
		speed = 1;
	
		//if(setOnceDir == false){
		//	setOnceDir = true;
		//	direction = choose(0, 180);
		//}
		direction = choose(0, 180);
	} else{ 
		gravity = 0.1;
	}

	jumpTimer--;

	if(jumpTimer <= 0){
	
		if(direction == 0){ direction = 45; }
		if(direction == 180){ direction = 135; }
	
		jumpTimer = irandom_range(45, 90);
	
		speed = random_range(4, 5);
		gravity = 0.1;
	}

	if (increasing){
	    image_yscale += 0.01;
	    if (image_yscale > 0.9)
	    {
	        increasing = false;
	    }
	}
	else{
	    image_yscale -= 0.01;
	    if (image_yscale < 0.7)
	    {
	        increasing = true;
	    }
	}

	//vertical collision
	if (place_meeting(x,y+vspeed,oBlock)) {
		var onepixel = sign(vspeed);
		while (!place_meeting(x,y+onepixel,oBlock)) y += onepixel;
		vspeed = 0;
		gravity = 0;
	}

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

} else { //si el juego esta en pausa todo se queda quieto
	speed = 0;
	direction = 0;
	vspeed = 0;
	gravity = 0;
}
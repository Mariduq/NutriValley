
#region Calculate Movement and Collisions

if (!oPause.pause) { //si no esta en pausa, calcula movimiento y colisiones
	
	//calculate horizontal movement
	hsp = current_dir*hsp_max;


	//calculate vertical movement
	vsp += grav;
	vsp = clamp (vsp, -vsp_max, vsp_max);

	//horizontal collision
	if (place_meeting(x+hsp,y,oBlock)) { //esto chequea que si en la posicion en la que vamos a poner oPlayer este overlaps con oBlock
		var onepixel = sign(hsp); //para saber si vamos izquierda o derecha, sera un pixel ya sea -1 o 1
		while (!place_meeting(x+onepixel,y,oBlock)) x += onepixel; // checks if at 1 pixel we overlap with oBlock, if not move a onepixel
		hsp = 0; //after we reach the oBlock we make the speed 0 to stop moving
		current_dir *= -1; //changes directions
	}

	//commit to horizontal movement
	x += hsp; //se cambia la posicion del player usando hsp


	//vertical collision
	if (place_meeting(x,y+vsp,oBlock)) {
		var onepixel = sign(vsp);
		while (!place_meeting(x,y+onepixel,oBlock)) y += onepixel;
		vsp = 0;
	}

	//commit to vertical movement
	y += vsp;
	}
	
#endregion

#region Defeat

if (place_meeting(x,y,oBullet)) {
	instance_create_layer(x,y,"Bad", oExplode);
	instance_destroy();
	instance_destroy(oBullet);
}

#endregion

#region Player Death

if (!global.invin_enemies) {
	//Game Over
	if (place_meeting(x,y, oPlayer)) {
		with (oPlayer) {
			death();
		}
	}
}
#endregion
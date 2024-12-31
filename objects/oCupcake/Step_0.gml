if (!oPause.pause) { //si no esta en pausa, moverse
	
	var c = cos(dir);
	var s = sin(dir);
	var r = 12;
	repeat abs(spd)
	{
	    //Avoid walls vertically
	    while (place_meeting(x, y, oBlock))
	    {
	        x -= s;
	        y += c;
	    }

	    //Make sure the object always touches the ground
	    while (!place_meeting(x + s, y - c, oBlock))
	    {
	        x += s;
	        y -= c;
	    }

	    //Adjust angle in the negative direction
	    while (!place_meeting(x + r * c, y + r * s, oBlock))
	    {
	        dir -= pi / 60;
	        c = cos(dir);
	        s = sin(dir);
	    }

	    //Adjust angle in the positive direction
	    while (place_meeting(x + r * c, y + r * s, oBlock))
	    {
	        dir += pi / 60;
	        c = cos(dir);
	        s = sin(dir);
	    }
	    x += c;
	    y += s;
	}
	image_angle = 180 - dir * 180 / pi;

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
}
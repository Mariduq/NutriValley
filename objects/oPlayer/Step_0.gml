//el evento step es algo que ocurre cada frame
//sirve para cuando queremos hacer o chequear algo todo el rato

//chequea si las teclas de izquierda y derecha estan siendo presionadas
#region Player inputs

//get inputs

if (!instance_exists(oFade) && !oPause.pause) { //only get the inputs when the screen is not fading
	
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
	key_jump_held = keyboard_check(vk_up) || keyboard_check(ord("W")) || keyboard_check(vk_space);
} else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	key_jump_held = 0;
}

#endregion

#region Calculate movement


//calculate horizontal movement

//will reduce walldelay by 1 until we hit 0
walljumpdelay = max(walljumpdelay-1, 0);

if (walljumpdelay == 0) { //won't be able to move left/right until this equals 0
	
	// get move direction (-1 is left, 1 is right, 0 is nothing)
	var dir = key_right - key_left;

	// get horizontal speed or hsp (negative hsp means left, positive means right)
	hsp += dir*accel;

	if (dir == 0) { //slow down character if no direction key is pressed

		if (hsp < 0) { //going left
			hsp = min(hsp + decel, 0);
		} else { //going right
			hsp = max(hsp - decel, 0);
		}
	}

	//clamps de value so it doesn't go adove a certain range
	hsp = clamp(hsp, -max_hsp, max_hsp); // set the max speed, left or right


	//Wall jump
	if (onwall != 0) && (!onground) && (key_jump) { //on wall, in the air and jump key pressed
		walljumpdelay = walljumpdelay_max; //just wall jumped, so no horizontal movement
		
		//change hsp to be oposite of wall, jump away from wall
		hsp = -onwall * hsp_wjump;
		//change vsp to jump vertically differently than from the ground
		vsp = jumpspeed_wall;
		
		//play sound effect
		if (!audio_is_playing(sndJump)) {
			audio_play_sound(sndJump,1,false);
		}
	}

}
//calculate vertical movement
if (!oPause.pause) {

	//gravity
	var grav_final = grav; //imports grav from the create event
	var vsp_max_final = max_vsp; //import max_vsp from create event

	if (onwall != 0) && (vsp > 0) { // if sliding down on wall
		grav_final = grav_wall; // slide slower than in the air
		vsp_max_final = max_vsp_wall; //slide slower than in the air
	}
	vsp += grav_final;

	//limitamos la velocidad vertical a max vsp
	vsp = clamp(vsp, -vsp_max_final, vsp_max_final);

	//ground jump
	if (!global.infinite_jumps) {
		if (jumpbuffer > 0 ) { //ckeck if the jumpbuffer is greater than 0
			jumpbuffer--; //reduces jumpbuffer variable by 1 each step
	
			if (key_jump) {//checks if key_jump was pressed
				jumpbuffer = 0; //set to 0 so player can't jump again
				vsp = jumpspeed; //jump up
				//play sound effect
				if (!audio_is_playing(sndJump)) {
					audio_play_sound(sndJump,1,false);
				}
			}
		}
	} else {
		if (key_jump) {//checks if key_jump was pressed
			vsp = jumpspeed; //jump up
			//play sound effect
			if (!audio_is_playing(sndJump)) {
				audio_play_sound(sndJump,1,false);
			}
		}
	}

	//salto de altura variada
	if (vsp < 0) && (!key_jump_held) { //if holding up and not holding jump key
		vsp = max(vsp, -3); // set vsp to higher (less negative) number
	}
} else {
	vsp = 0;
	hsp = 0;
}
#endregion

#region Collisions

//horizontal collision
if (place_meeting(x+hsp,y,oBlock)) { //esto chequea que si en la posicion en la que vamos a poner oPlayer este overlaps con oBlock
	var onepixel = sign(hsp); //para saber si vamos izquierda o derecha, sera un pixel ya sea -1 o 1
	while (!place_meeting(x+onepixel,y,oBlock)) x += onepixel; // checks if at 1 pixel we overlap with oBlock, if not move a onepixel
	hsp = 0; //after we reach the oBlock we make the speed 0 to stop moving
}

//commit to horizontal movement
x += hsp; //se cambia la posicion del player usando hsp


//vertical collision
if (place_meeting(x,y+vsp,oBlock)) {
	var onepixel = sign(vsp);
	while (!place_meeting(x,y+onepixel,oBlock)) y += onepixel;
	vsp = 0;
	onground = true;
} else {
	onground = false;
}

//commit to vertical movement
y += vsp;

if (place_meeting(x+hsp,y,oBowl)) { //esto chequea que si en la posicion en la que vamos a poner oPlayer este overlaps con oBowl
	if(global.allIngredients >= floor(global.totalIngredients/2) && global.allIngredients < global.totalIngredients){
		oBowl.image_index = 1;
		oBowl.text = "¡Ya llevas la mitad, sigue así!";
	} else if(global.allIngredients >= global.totalIngredients){
		oBowl.image_index = 2;
		oBowl.text = "¡Felicidades, ya puedes pasar por la puerta!";
	}
}

#endregion

#region Current status

//calculate current status
onground = place_meeting(x, y+groundbuffer, oBlock); //this lets us know when we are on the ground
if (onground) jumpbuffer = 10; //plus it gives us a jumpbuffer witch makes jumping feel better

//check if player on or next to wall (if in right wall it will be 1, if in left it will be -1)
onwall = place_meeting(x+1,y, oBlock) - place_meeting(x-1, y, oBlock)

#endregion

#region Animations

if (!oPause.pause) {
	//Adjust sprite
	image_speed = 1; //100% of animation speed
} else {
	image_speed = 0;
}
	//if moving, orient sprite acording direccion of the movement
if (hsp != 0) image_xscale = sign(hsp); //si sign(hsp) es -1 la imagen se volteara

if (!onground) { //if in the air
	if (onwall != 0) { //if on the wall and off the ground
		sprite_index = sPlayerWall;
		//because onwall gives 1 or -1 if we are on a riht or left wall...
		image_xscale = onwall; //this will be used to flip the sPlayerWall sprite accordingly
	} else {
	
		sprite_index = sPlayerAir;
		image_speed = 0; //stop animation speed, make still image
	
		//because it's (like this) it will check if vsp > 0, if it is it will return true (1)
		image_index = (vsp > 0); //falling = 1, evarything else = 0
	
	}
	
} else { //if on the ground
	if (hsp != 0) { //if moving left or right
		sprite_index = sPlayerRun;
		
		//play sound effect
		if (!audio_is_playing(sndStep)) {
			audio_play_sound(sndStep,1,false);
		}
		
	} else { // standing still
		sprite_index = sPlayer;
	}
}

if (lifeImageIncreasing){
    lifeImageScale += 0.025;
    if (lifeImageScale == 1)
    {
        lifeImageIncreasing = false;
    }
}
else{
    lifeImageScale -= 0.025;
    if (lifeImageScale == -1)
    {
        lifeImageIncreasing = true;
    }
}


#endregion

#region Game control

//open inventory
if (keyboard_check_pressed(ord("E")) && oPause.pause == false){
	showInventory = !showInventory;
	if (!audio_is_playing(sndButtonClick)) {
		audio_play_sound(sndButtonClick,1,false);
	}
}

#endregion
//we use 3 / to give information to GameMaker

///@function		fadeout(target_room);
///@param (index)	{_targetroom}		the room to transition to
///@param (integer)	{_target_x}		target x location for the player object
///@param (integer)	{_target_y}		target y location for the player object

function fadeout(_targetroom, _target_x, _target_y){
	
	global.target_x = _target_x;
	global.target_y = _target_y;
	
	if (!instance_exists(oFade)) {
		//we assign the instance to a variable so we can modifify it's parameters using "with"
		var _fade = instance_create_layer(0,0,"Player", oFade);
		with (_fade) {
			a = 0;
			fade_out = true;
			target_room = _targetroom;
		}
	}
}
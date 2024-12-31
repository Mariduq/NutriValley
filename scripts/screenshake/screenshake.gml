/// @desc		screenshake(magnitude, frames)
/// @param		{magnitude}		magnitude sets the strength of the shake (radius in pixels)
/// @param		{frames}		frames set of the length of the shake in frames (60 = 1 second)

function screenshake(_magnitude, _frames){
	
	with (oCamera) {
		if (_magnitude > shake_remain) {
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frames;
		}
	}
	
}
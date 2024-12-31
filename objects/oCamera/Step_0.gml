//Update destination
if (instance_exists(follow)) { //if there is an object to follow
	xTo = follow.x; // set xTo to be that object's x position
	yTo = follow.y; // set yTo to be that object's y position
}

//update object position
x += (xTo - x) / cam_followspeed; //moves slower the closer it gets to the follow object
y += (yTo - y) / cam_followspeed; //moves slower the closer it gets to the follow object

//keeps the camera from leaving the room boundaries
x = clamp(x, view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y, view_h_half+buff, room_height-view_h_half-buff);

//screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length) * shake_magnitude));

//update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
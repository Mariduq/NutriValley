// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fadein(){
	if (!instance_exists(oFade)) {
		//since it will cover the whole screen it doesn't matter where is created, that's why we put 0,0
		instance_create_layer(0,0,"Player", oFade);
	}
	//since oFade by deafault is set to fadeout_false this is all we have to do
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu(_x,_y,_options,_description = -1){
	with(instance_create_depth(_x,_y,-999,oMenu)){
		options = _options;
		description = _description;
		optionsCount = array_length(_options);
		hovermarker = "* ";
		
		//Ajustando el tamaño
		margin = 8;
		draw_set_font(fDefault);
		
		width = 1;
		if(_description != -1) width = max(width, string_width(_description));
		for(var i = 0; i < optionsCount; i++){
			width = max(width, string_width(_options[i][0]));
		}
		width += string_width(hovermarker);
		
		heightLine = 22;
		height = heightLine * (optionsCount + !(description == 1));
		widthFull = width + margin * 2;
		heightFull = height + margin * 2;
	}
}
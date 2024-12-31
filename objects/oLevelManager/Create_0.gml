/// @description Se inicializan los valores de las barras

MAX_PROTEIN_FAT_CARB = 75;
BAR_SIZE_FACTOR = 100 / MAX_PROTEIN_FAT_CARB;

WATER_BAR_SIZE_FACTOR = 100 / 625

required_nutrients = ds_map_create();
collected_nutrients = ds_map_create();
bar_sizes = ds_map_create();

#region nutrients

// proteins

required_nutrients[? "protein"] = 0
collected_nutrients[? "protein"] = 0

// fats

required_nutrients[? "fat"] = 0
collected_nutrients[? "fat"] = 0

// carbohydrates

required_nutrients[? "carbohydrate"] = 0
collected_nutrients[? "carbohydrate"] = 0

// vitamins

//required_nutrients[? "vitamins"] = 0
//collected_nutrients[? "vitamins"] = 0

// minerals

//required_nutrients[? "minerals"] = 0
//collected_nutrients[? "minerals"] = 0

// water

required_nutrients[? "water"] = 0
collected_nutrients[? "water"] = 0

// other

//required_nutrients[? "fiber"] = 0
//collected_nutrients[? "fiber"] = 0

#endregion

/// @description Draws a bar
/// @param _name
/// @param _color
/// @param _pos
function draw_bar(_name, _color, _pos) {

  _value = collected_nutrients[? _name];
  _max_value = required_nutrients[? _name];
  _bar_size = bar_sizes[? _name];

  if (_max_value == 0) {
    return;
  }

  var _bar_scale = 1.5;
  var _bar_x = 50;
  var _bar_final_size = _bar_size * _bar_scale;
  var _value_width = (_value / _max_value) * _bar_final_size;
  var _bar_height = 10;
 
  
  if (instance_exists(oPlayer) and oPlayer.showInventory) {
	  _bar_x += 300;
  }
  
  draw_set_alpha(1.0);
  draw_set_color(c_black);
  draw_rectangle(_bar_x, _pos, _bar_x + _bar_final_size, _pos + _bar_height, false);
  

  draw_set_alpha(0.5);
  draw_set_color(_color);
  draw_rectangle(_bar_x, _pos, _bar_x + _bar_final_size, _pos + _bar_height, false);

  draw_set_alpha(1.0);
  draw_rectangle(_bar_x, _pos, _bar_x + _value_width, _pos + _bar_height, false);
  
  draw_set_color(c_white);
  if(_name == "protein"){
	draw_text(_bar_x + 100, _pos - 12, "Proteínas");
  } else if(_name == "fat"){
	draw_text(_bar_x + 100, _pos -12, "Grasas");
  } else if(_name == "carbohydrate"){
	draw_text(_bar_x + 100, _pos - 12, "Carbohidratos");
  } else if(_name == "water"){
	draw_text(_bar_x + 100, _pos - 12, "Agua");
  }
}
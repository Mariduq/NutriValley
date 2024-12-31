// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function addNutrient(_name, _value) {
  // check if the nutrient is valid

  if (_value <= 0) {
    return;
  }

  //if (_name != "protein" && _name != "fat" && _name != "carbohydrate" && _name != "vitamins" && _name != "minerals" && _name != "water" && _name != "fiber") {
  //  return;
  //}
  
  if (_name != "protein" && _name != "fat" && _name != "carbohydrate" && _name != "water") {
	return;
  }

  if (!instance_exists(oLevelManager)){
    return;
  }

  if (!ds_exists(oLevelManager.collected_nutrients, ds_type_map)){
    return;
  }

  if (ds_map_exists(oLevelManager.collected_nutrients, _name)){
    oLevelManager.collected_nutrients[? _name] += _value;
  } else {
    oLevelManager.collected_nutrients[? _name] = _value;
  }

  if (ds_exists(oLevelManager.required_nutrients, ds_type_map)){
    if (oLevelManager.collected_nutrients[? _name] > oLevelManager.required_nutrients[? _name]){
      oLevelManager.collected_nutrients[? _name] = oLevelManager.required_nutrients[? _name];
    }
  }

}
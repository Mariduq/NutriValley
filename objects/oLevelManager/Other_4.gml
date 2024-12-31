/// @description Se balancean las barras



// function to balance the scales

bar_sizes[? "protein"] = 0
bar_sizes[? "fat"] = 0
bar_sizes[? "carbohydrate"] = 0
//bar_sizes[? "vitamins"] = 0
//bar_sizes[? "minerals"] = 0
bar_sizes[? "water"] = 0
//bar_sizes[? "fiber"] = 0


// proteins

if (required_nutrients[? "protein"] > 0) {
  
  bar_sizes[? "protein"] = required_nutrients[? "protein"] * BAR_SIZE_FACTOR;
  
} else {
  
  bar_sizes[? "protein"] = 0;
  
}

// fats

if (required_nutrients[? "fat"] > 0) {
  
  bar_sizes[? "fat"] = required_nutrients[? "fat"] * BAR_SIZE_FACTOR;
  
} else {
  
  bar_sizes[? "fat"] = 0;
  
}

// carbohydrates

if (required_nutrients[? "carbohydrate"] > 0) {
  
  bar_sizes[? "carbohydrate"] = required_nutrients[? "carbohydrate"] * BAR_SIZE_FACTOR;
  
} else {
  
  bar_sizes[? "carbohydrate"] = 0;
  
}

// vitamins

//if (required_nutrients[? "vitamins"] > 0) {
  
//  bar_sizes[? "vitamins"] = 10;
  
//} else {
  
//  bar_sizes[? "vitamins"] = 0;
  
//}

// minerals

//if (required_nutrients[? "minerals"] > 0) {

//  bar_sizes[? "minerals"] = 10;

//} else {

//  bar_sizes[? "minerals"] = 0;

//}

// water

if (required_nutrients[? "water"] > 0) {

  //bar_sizes[? "water"] = required_nutrients[? "water"] * WATER_BAR_SIZE_FACTOR;
  bar_sizes[? "water"] = required_nutrients[? "water"] * BAR_SIZE_FACTOR;

} else {

  bar_sizes[? "water"] = 0;

}

// fiber

//if (required_nutrients[? "fiber"] > 0) {

//  bar_sizes[? "fiber"] = required_nutrients[? "fiber"] * 2; // to show the difference between levels

//} else {

//  bar_sizes[? "fiber"] = 0;

//}



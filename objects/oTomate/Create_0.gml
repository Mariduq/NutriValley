info = "El tomate se destaca por su contenido en vitamina A y vitamina C, entre los minerales se encuentra presente el potasio. Estos nutrientes benefician a nuestro organismo, previniendo enfermedades y favoreciendo las funciones intestinales.";

if(room == rLevel1){
	function collected() {
		addNutrient("protein", 0.17902813299232737)
		addNutrient("fat", 0.03424657534246575)
		addNutrient("carbohydrate", 0.21085925144965736)
		addNutrient("water", 1.079760763365749)
	}
} else if(room = rLevel4){
	function collected() {
		addNutrient("protein", 0.4575263077626963)
		addNutrient("fat",0.3255738238645613)
		addNutrient("carbohydrate", 0.6750892082168)
		addNutrient("water", 5.494393327403432)
	}
}
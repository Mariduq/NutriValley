info = "La lechuga es baja en carbohidratos y aporta mucha fibra que ayuda con el estreñimiento y da mayor saciedad al comer. Aporta al funcionamiento del organismo gracias a sus vitaminas y minerales que nos protegen de enfermedades.";

if(room == rLevel1){
	function collected() {
		addNutrient("protein", 0.3069053708439898);
		addNutrient("fat", 0.06849315068493152);
		addNutrient("carbohydrate", 0.4612546125461255);
		addNutrient("water", 2.150390357485276);
	}
} else if(room == rLevel4){
	function collected() {
		addNutrient("protein", 0.4575263077626963);
		addNutrient("fat", 0.3255738238645613);
		addNutrient("carbohydrate", 0.6750892082168);
		addNutrient("water", 5.494393327403432);
	}
}

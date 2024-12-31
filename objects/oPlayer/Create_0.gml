//create es el evento de cuando el objeto se crea
//estas variables se crearan junto al objeto

#region speeds
hsp = 0; //horizontal speed variable, not called hspeed (that variable is reserved by gamemaker)
max_hsp = 5; //max horizontal speed
vsp = 0; //vertical speed variable, not called vspeed (that variable is reserved by gamemaker)
max_vsp = 14; //max vertical speed
grav = 0.5; 
lifeImageScale = 1; //To rotate life image with xscale
lifeImageIncreasing = false //To check how to rotate life sprite
deletedItems = [];
if(string_digits(string(room)) != string_digits(string(global.checkpoint_room))){
	global.allIngredients = 0;
} else{
	loadgame();
}
global.totalIngredients = array_length(layer_get_all_elements("Items"));
global.instanceID = [];

#endregion

#region player inputs
key_left = 0;
key_right = 0;
key_jump = 0;
key_jump_held = 0;
key_attack = 0;

#endregion

#region attack
attack_cooldown = 0;
attack_max = 20; //number of frames before we can attack again

#endregion

#region jumping
onground = false;
groundbuffer = 10; //let's us jump if we're at least 10 pixels close to the ground


if (!global.higher_jumps) {
	jumpspeed = -12; //a jump height, more negative = higher,it's value in positive can't be bigger than max_vsp

} else {
	jumpspeed = -14;
}

jumpbuffer = 4; //frames after leaving the ground where we can still jump, coyote time

//wall
onwall = 0;
grav_wall = 0.1; //gravity is reduced when sliding down a wall
hsp_wjump = 6; //max hsp for moving away from wall during wall jump
jumpspeed_wall = -9; //how high you jump during the wall jump
max_vsp_wall = 5; //max falling speed when sliding
//player loses control form 20 frames after a wall jump
walljumpdelay = 0;
walljumpdelay_max = 20; //we can change this to whatever feels good for us

#endregion

#region momentum
accel = 0.5; //an acceleration variable set to 0.5
decel = 0.3; //a decelearation variable set to 0.3

#endregion

#region Inventory

//data structure para el inventario
inventory = ds_map_create();

//ds_list tiene unas funciones que ds_map no tiene, por eso usaremos list tambien
inventoryItems = [];

showInventory = false;

#endregion

#region inventory items interaction and drawing

GRID = 64;

ITEMS_Y = GRID * 2;
ITEMS_X = GRID * 1.25;
ITEM_H = GRID;
ITEM_W = GRID * 2.5;

highlighted = -1;
activeObject = -1;
disableObjectTimer = 0;

//savegame();

#endregion
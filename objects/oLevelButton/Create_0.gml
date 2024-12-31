//top left corner of button
x1 = x-(sprite_width/2);
y1 = y-(sprite_height/2);

//button right corner of button
x2 = x+(sprite_width/2);
y2 = y+(sprite_height/2);

hover = false;

//estos datos se modifican en las instancias de forma individual

#region Datos a Modificar

//texto que aparece en el boton
texto = "";

//nivel al que te llevara el boton
roomlevel = rLevels;

//coordenadas xy del player cuando no hay checkpoint
default_x = 0;
default_y = 0;

//niveles minimos que deberan ser superados (global.level_win) para poder desbloquear este
desbloqueo = 0;

#endregion
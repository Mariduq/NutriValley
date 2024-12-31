/// @description Chequea si el jugador está cerca y tiene el objeto activo adecuado para abrirse

if (image_index == image_number - 1) {
  instance_destroy();
}

if (lastAnswerTimer > 0) {
	lastAnswerTimer -= 1;
}

if (!done && distance_to_object(oPlayer) < 128 && oPlayer.activeObject != -1) {
  var objectName = object_get_name(oPlayer.activeObject);
  var correctObjectName = object_get_name(correctAnswer);
  if (objectName == correctObjectName) {
    image_speed = 1;
    done = true;
    audio_play_sound(sndButtonClick,1,false);
  } else if (lastAnswerTimer <= 0) {
	audio_play_sound(sndAttack,1,false);
  }
  lastAnswerTimer = 31;
}





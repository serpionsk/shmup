alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);


atirando = function()
{
	var _tiro_inimigo = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo);
	_tiro_inimigo.vspeed += 2;
	alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);
}
alarm[0] = game_get_speed(gamespeed_fps) * 2;
randomise();

atirando = function()
{
	var _tiro_inimigo = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo);
	_tiro_inimigo.vspeed += 2;
	alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);
}

morrendo = function()
{
	destroi_unidade(obj_explosao_inimigo);
	var _chance = random(100);
	if (_chance > 90)
	{
		instance_create_layer(x, y, "Coletaveis", obj_power_up);
	}
}

estou_em_sequencia = in_sequence;
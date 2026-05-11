alarm[0] = game_get_speed(gamespeed_fps) * 2;
randomise();
inicia_efeito_mola();
inicia_efeito_dano();

atirando = function()
{
	audio_stop_sound(sfx_enemy_shoot);
	snd_effect(sfx_enemy_shoot);
	var _tiro_inimigo = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo);
	_tiro_inimigo.vspeed += 2;
	alarm[0] = game_get_speed(gamespeed_fps) * random_range(1, 2);
}

morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	screanshake(5);
	destroi_unidade(obj_explosao_inimigo);
	var _chance = random(100);
	if (_chance > 90)
	{
		instance_create_layer(x, y, "Coletaveis", obj_power_up);
	}
	snd_effect(sfx_enemy_explosion);
}

estou_em_sequencia = in_sequence;
vidas = 4;
alarm[0] = game_get_speed(gamespeed_fps) * 1;
randomise();
inicia_efeito_mola();
inicia_efeito_dano();

atirando = function()
{
	audio_stop_sound(sfx_enemy_shoot);
	snd_effect(sfx_enemy_shoot);
	{
		var _tiro_inimigo = instance_create_layer(x+5, y, "Projetil", obj_tiro_inimigo_hard);
		var _tiro_inimigo2 = instance_create_layer(x-5, y, "Projetil", obj_tiro_inimigo_hard);
		var _tiro_inimigo3 = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo_hard);
		_tiro_inimigo.vspeed += 2;
		_tiro_inimigo.direction = 273;
	
		_tiro_inimigo2.direction = 260;
		_tiro_inimigo2.vspeed += 2;
	
		_tiro_inimigo3.vspeed += 2;
	}
	alarm[0] = game_get_speed(gamespeed_fps) * .9
}

morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	vidas--;
	show_debug_message("perdi 1hp")
	screanshake(5);
	if (vidas < 1)
	{
		show_debug_message("morri")
		power_up(85);
		global.pontos += 8;
		destroi_unidade(obj_explosao_inimigo);
		screanshake(10);
		snd_effect(sfx_enemy_explosion);
	}

	
}

estou_em_sequencia = in_sequence;
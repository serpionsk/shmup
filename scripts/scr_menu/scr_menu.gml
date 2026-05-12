global.destino = rm_jogo

function snd_effect(_effect = sfx_enemy_explosion, _range = .1)
{
	var _pitch = random_range(1+_range, 1-_range)
	audio_play_sound(_effect, 0, 0, , , _pitch)
}

function muda_tela()
{
	room_goto(global.destino);	
	global.transicao = false;
	audio_stop_all();
}
function finaliza_transicao()
{
	global.transicao = false;
}
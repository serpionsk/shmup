//funcao de movimentacao, escudo e tiro do player
controla_player();

if (keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}


//se quiser voltar mais rapido aumente a variavel _modificador que por padrao ja e 0.3
desfaz_efeito_mola();

timer_efeito_dano();
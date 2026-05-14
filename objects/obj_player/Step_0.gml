//funcao de movimentacao, escudo e tiro do player
controla_player();


//se quiser voltar mais rapido aumente a variavel _modificador que por padrao ja e 0.3
desfaz_efeito_mola();

timer_efeito_dano();

if (global.gamemode == "hard" && !check_hardmode)
{
	layer_sequence_create("ModeHardOn", room_width/2 , room_height/2 , sq_modehard);
	check_hardmode = true;
}

muda_cor_planeta();
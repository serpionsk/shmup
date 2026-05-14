viewHei = display_get_gui_height()/2;
viewWid = display_get_gui_width()/2;

menu = ["Play", "Tutorial", "Options", "Customize", "Quit"];
atual = 0;
margem = 40;


controla_menu = function()
{
	if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
	{
		atual += 1;
		snd_effect(snd_zap);
		margem = 0;
	}
	if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
	{
		atual -= 1;
		snd_effect(snd_zap);
		margem = 0;
	}
	if (keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}
	
	atual = clamp(atual, 0, array_length(menu)-1)
	margem = lerp(margem, 40, .1)
}
desenha_menu = function()
{
	draw_set_valign(1);
	draw_set_font(fnt_space);

	for (var i = 0; i < array_length(menu) ; i++)
	{
		var _cor = c_white
		var _marg = 0
	
		if (i == atual)
		{
			_cor = c_red;
			_marg = margem
		}
	
		draw_set_colour(_cor)
		draw_text(20 + _marg, viewHei+i*30, menu[i]);
		draw_set_colour(-1)
	
	}

	draw_set_valign(0);
	draw_set_font(-1);
}
ativa_menu = function()
{
	switch(atual)
	{
		//Play
		case 0:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_jogo;
			global.transicao = true;
		break;
		
		//Tutorial
		case 1:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_tutorial;
			global.transicao = true;
		break;
		case 2:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_options;
			global.transicao = true;
		break;		
		case 3:
			layer_sequence_create("Transicao", room_width/2, room_height/2, sq_transicao1);
			global.destino = rm_customize;
			global.transicao = true;
		break;
		
		//Quit
		case 4:
			game_end();
		break;
	}
}
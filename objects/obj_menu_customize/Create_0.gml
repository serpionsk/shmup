viewHei = display_get_gui_height()/2-150;
viewWid = display_get_gui_width()/2;

menu = ["Planet", "SpaceShip", "Back"];
atual = 0;
margem = 100;

instance_create_layer(room_width/2, 215, "Instances", obj_planet);
instance_create_layer(room_width/2, 350, "Instances", obj_player_GUI);



controla_menu_customize = function()
{
	if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
	{
		atual += 1;
		snd_effect(snd_zap);
	}
	if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
	{
		atual -= 1;
		snd_effect(snd_zap);
	}
	if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")))
	{
		avanca_menu();
	}
	if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")))
	{
		volta_menu();
	}
	if (keyboard_check_pressed(vk_escape))
	{
		room_goto(rm_inicio);
	}
	
	atual = clamp(atual, 0, array_length(menu)-1)
}
desenha_menu = function()
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);

	draw_set_font(fnt_space);

	for (var i = 0; i < array_length(menu) ; i++)
	{
		var _cor = c_white
		var _marg = 0
	
		if (i == atual)
		{
			_cor = c_red;
			_marg = margem
			global.setaatual = atual
		}
	
		draw_set_colour(_cor)
		draw_text(215, viewHei+i*200, menu[i]);
		
	
	}
	
	draw_set_valign(0);
	draw_set_halign(0);
	draw_set_font(-1);
}
avanca_menu = function()
{
	if (atual == 0)
	{
		switch(global.planeta_atual)
		{
			//azul
			case 0:
				global.planeta_atual +=1;
			break;
			//vermelho
			case 1:
				global.planeta_atual +=1;
			break;
			//roxo
			case 2:
				global.planeta_atual +=1;
			break;
			//verde
			case 3:
				global.planeta_atual +=1;
			break;
			//preto e branco
			case 4:
				global.planeta_atual +=1;
			break;
			//reset
			case 5:
				global.planeta_atual +=1;
			break;
		}
	}
	if (atual == 1)
	{
		switch(global.nave_atual)
	{
			//azul
			case 0:
				global.nave_atual +=1;
			break;
			//vermelho
			case 1:
				global.nave_atual +=1;
			break;
			//roxo
			case 2:
				global.nave_atual +=1;
			break;
			//verde
			case 3:
				global.nave_atual +=1;
			break;
			//preto e branco
			case 4:
				global.nave_atual +=1;
			break;
			//reset
			case 5:
				global.nave_atual +=1;
			break;
		}
	}
}
volta_menu = function()
{
	if (atual == 0)
	{
		switch(global.planeta_atual)
		{
			//azul
			case 0:
				global.planeta_atual -=1;
			break;
			//vermelho
			case 1:
				global.planeta_atual -=1;
			break;
			//roxo
			case 2:
				global.planeta_atual -=1;
			break;
			//verde
			case 3:
				global.planeta_atual -=1;
			break;
			//preto e branco
			case 4:
				global.planeta_atual -=1;
			break;
			//reset
			case 5:
				global.planeta_atual -=1;
			break;
		}
	}
	if (atual == 1)
	{
		switch(global.nave_atual)
	{
			//azul
			case 0:
				global.nave_atual -=1;
			break;
			//vermelho
			case 1:
				global.nave_atual -=1;
			break;
			//roxo
			case 2:
				global.nave_atual -=1;
			break;
			//verde
			case 3:
				global.nave_atual -=1;
			break;
			//preto e branco
			case 4:
				global.nave_atual -=1;
			break;
			//reset
			case 5:
				global.nave_atual -= 1;
			break;
		}
	}
}
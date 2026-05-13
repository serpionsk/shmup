speed_variavel = 2
vidas = 5;


if (x < room_width/2)
{
	estado = "chegando_esquerda"
}
else if (x > room_width/2)
{
	estado = "chegando_direita"
}

timer_tiro = game_get_speed(gamespeed_fps) * .5;
contador_tiro = 0;
decidi_direcao = false;
inicia_efeito_mola();
inicia_efeito_dano();

maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando_esquerda":
		{
			if (x < random_range(30, 260))
			{
				x += speed_variavel;
			}
			else
			{
				estado = "carregando";
			}
		}
		break;
		case "chegando_direita":
		{
			if (x > random_range(30, 260))
			{
				x -= speed_variavel;
			}
			else
			{
				estado = "carregando";
			}
		}
		break;
		case "carregando":
		{
			if (timer_tiro > 0)
			{
				timer_tiro--;
			}
			else
			{
				estado = "atirando";
				contador_tiro++;
				timer_tiro = game_get_speed(gamespeed_fps) * 1;
				
			}
		}
		break;
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				var _dir2 = 255;
				repeat(3)
				{
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo3);
					_tiro.speed += 4;
					_tiro.direction = _dir2;
					_dir2 += 15;
				}
				if (contador_tiro < 2)
				{
					estado = "carregando";
				}
				else
				{
					estado = "fugindo";
				}
			}
		}
		break;
		case "fugindo":
		{
			if (decidi_direcao == false)
			{
				hspeed = choose(-1, 1);
				decidi_direcao = true;
			}
			vspeed = -speed_variavel/2;
			if (y <= -67)
			{
				instance_destroy();
				show_debug_message("inimigo 2 abatido!");
			}
		}
		break;
	}
}


morrendo = function()
{
	efeito_mola(1.3, 0.8);
	contador_efeito_dano(2);
	
	vidas--;
	screanshake(5);
	if (vidas < 1)
	{
		power_up(87);
		global.pontos += 4;
		destroi_unidade(obj_explosao_inimigo);
		screanshake(10);
	}
}
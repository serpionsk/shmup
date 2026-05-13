vidas = 8;
estado = "chegando"
timer_tiro = game_get_speed(gamespeed_fps) * 3;
contador_tiro = 0;
decidi_direcao = false;
inicia_efeito_mola();
inicia_efeito_dano();

maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if (y < random_range(113, 180))
			{
				y += 1;
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
				estado = choose("atirando", "atirando2");
				contador_tiro++;
				timer_tiro = game_get_speed(gamespeed_fps) * 2;
				
			}
		}
		break;
		case "atirando":
		{
			if (instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo2a);
				_tiro.vspeed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir+90;
				if (contador_tiro < 3)
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
		case "atirando2":
		{
			if (instance_exists(obj_player))
			{
				var _dir2 = 255;
				repeat(3)
				{
					var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo2b);
					_tiro.speed += 4;
					_tiro.direction = _dir2;
					_dir2 += 15;
				}
				if (contador_tiro < 3)
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
			vspeed = -1;
			if (y <= -67)
			{
				instance_destroy();
				
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
		power_up(80);
		global.pontos += 8;
		destroi_unidade(obj_explosao_inimigo);
		screanshake(10);
	}
}
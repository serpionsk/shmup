vidas = 10;
show_debug_message(y)
estado = "chegando"
timer_tiro = game_get_speed(gamespeed_fps) * 3;
maquina_de_estados = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if (y < 160)
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
				timer_tiro = game_get_speed(gamespeed_fps) * 3;
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
				estado = "carregando"
			}
		}
		break;
		case "atirando2":
		{
			if (instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
				var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro_inimigo2b);
				_tiro.vspeed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir+90;
				estado = "carregando"
			}
		}
		break;
	}
}


morrendo = function()
{
	vidas--;
	if (vidas < 1)
	{
		destroi_unidade(obj_explosao_inimigo);
	}
}
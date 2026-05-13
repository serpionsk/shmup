#region Variáveis globais
global.debug = false;
global.transicao = false;
global.pontos = 0;
global.spawn3 = 1;
global.gamemode = "easy";

#endregion

#region Funções
function destroi_unidade(_animacao = obj_explosao_tiro)
{
	instance_destroy();
	instance_create_layer(x, y, "Particles", _animacao);
}

function screanshake(_shake = 0)
{
	if (instance_exists(obj_screanshake))
	{
		with(obj_screanshake)
		{
			if (_shake > treme)
			{
				treme = _shake
			}
		}
	}
}

function inicia_efeito_mola()
{
	xscale = 1;
	yscale = 1;
}

function efeito_mola(_xscale = 1, _yscale= 1)
{
	xscale = _xscale
	yscale = _yscale
}

function desfaz_efeito_mola(_modificador = .3)
{
	xscale = lerp(xscale, 1, _modificador);
	yscale = lerp(yscale, 1, _modificador);
}

function desenha_efeito_mola()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 0, c_white, 1);
}

function inicia_efeito_dano()
{
	tomei_dano = 0;
}

function contador_efeito_dano(_contador = 5)
{
	tomei_dano = _contador;
}

function timer_efeito_dano()
{
	if (tomei_dano > 0) tomei_dano--;
}
function desenha_efeito_branco(_funcao_desenho = 0)
{
	if (tomei_dano)
	{
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	}
	else
	{
		_funcao_desenho();
	}
}

function power_up(_probabilidade = 95)
{
	var _power_up_atual = 0;
	var _power_ups = [obj_power_up, obj_power_up_clone, obj_power_up_hp, obj_power_up_escudo, obj_power_up_speed];
	var _random_select = irandom(array_length(_power_ups)-1);
	var _chance = random(100);
	
	if (_chance > _probabilidade)
	{
		instance_create_layer(x, y, "Coletaveis", _power_ups[_random_select]);
	}
}
function sound_power_up(_snd_up = sfx_power_up_colect)
{
	instance_destroy();
	global.pontos += 5
	var _part = instance_create_layer(x, y, layer, obj_explosao_tiro);
	_part.image_angle = random(359);
	snd_effect(_snd_up, .2);
}

#endregion
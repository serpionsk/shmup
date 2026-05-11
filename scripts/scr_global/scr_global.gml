#region Variáveis globais
global.debug = false;

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

function snd_effect(_effect = sfx_enemy_explosion)
{
	var _pitch = random_range(.9, 1.1)
	audio_play_sound(_effect, 0, 0, , , _pitch)
}

#endregion
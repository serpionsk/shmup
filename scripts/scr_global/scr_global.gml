#region Variáveis globais
global.debug = false;
global.transicao = false;
global.pontos = 100;
global.spawn3 = 1;
global.gamemode = "easy";
global.pontosmaximos = 0;

global.setaatual = 0;

global.planeta_atual = 0;
global.nave_atual = 0;
global.cor_player = "padrao"



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

function muda_cor_planeta()
{
	var layer_id_bg0 = layer_get_id("bg_0");
	var back_id_bg0 = layer_background_get_id(layer_id_bg0);
	
	var layer_id_bg1 = layer_get_id("bg_1");
	var back_id_bg1 = layer_background_get_id(layer_id_bg1);
	
	var layer_id_bg2 = layer_get_id("bg_2");
	var back_id_bg2 = layer_background_get_id(layer_id_bg2);
	
	var layer_id_bg3 = layer_get_id("bg_3");
	var back_id_bg3 = layer_background_get_id(layer_id_bg3);
	
	var layer_id_fg = layer_get_id("fg");
	var back_id_fg = layer_background_get_id(layer_id_fg);
	
	
	if (global.planeta_atual >= 5)
	{
		global.planeta_atual = 0
	}
	else if (global.planeta_atual <= -1)
	{
		global.planeta_atual = 4
	}
	
	
	switch(global.planeta_atual)
	{
		case 0:
			if (instance_exists(obj_planet))
			{
				obj_planet.sprite_index = spr_planet_padrao;
			}
			layer_background_sprite(back_id_bg0, spr_background0);
			layer_background_sprite(back_id_bg1, spr_background1);
			layer_background_sprite(back_id_bg2, spr_background2);
			layer_background_sprite(back_id_bg3, spr_background3);
			layer_background_sprite(back_id_fg, spr_background4);
		break;
		case 1:
			if (instance_exists(obj_planet))
			{
				obj_planet.sprite_index = spr_planet_red;
			}
			layer_background_sprite(back_id_bg0, spr_background0_red);
			layer_background_sprite(back_id_bg1, spr_background1_red);
			layer_background_sprite(back_id_bg2, spr_background2_red);
			layer_background_sprite(back_id_bg3, spr_background3_red);
			layer_background_sprite(back_id_fg, spr_background4_red);
		break;
		case 2:
			if (instance_exists(obj_planet))
			{
				obj_planet.sprite_index = spr_planet_roxo;
			}
			layer_background_sprite(back_id_bg0, spr_background0_roxo);
			layer_background_sprite(back_id_bg1, spr_background1_roxo);
			layer_background_sprite(back_id_bg2, spr_background2_roxo);
			layer_background_sprite(back_id_bg3, spr_background3_roxo);
			layer_background_sprite(back_id_fg, spr_background4_roxo);
		break;
		case 3:
			if (instance_exists(obj_planet))
			{
				obj_planet.sprite_index = spr_planet_verde;
			}
			layer_background_sprite(back_id_bg0, spr_background0_verde);
			layer_background_sprite(back_id_bg1, spr_background1_verde);
			layer_background_sprite(back_id_bg2, spr_background2_verde);
			layer_background_sprite(back_id_bg3, spr_background3_verde);
			layer_background_sprite(back_id_fg, spr_background4_verde);
		break;
		case 4:
			if (instance_exists(obj_planet))
			{
				obj_planet.sprite_index = spr_planet_PB;
			}
			layer_background_sprite(back_id_bg0, spr_background0_PB);
			layer_background_sprite(back_id_bg1, spr_background1_PB);
			layer_background_sprite(back_id_bg2, spr_background2_PB);
			layer_background_sprite(back_id_bg3, spr_background3_PB);
			layer_background_sprite(back_id_fg, spr_background4_PB);
		break;
	}
}
function muda_cor_player()
{
	var _nave_GUI = obj_player_GUI
	if (global.nave_atual > 5)
	{
		global.nave_atual = 0
	}
	else if (global.nave_atual <= -1)
	{
		global.nave_atual = 5
	}
	
	
	switch(global.nave_atual)
	{
		case 0:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player;
			}
			global.cor_player = "padrao"
		break;
		case 1:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player_red;
			}
			global.cor_player = "red"
		break;
		case 2:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player_roxo;
			}
			global.cor_player = "roxo"
		break;
		case 3:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player_verde;
			}
			global.cor_player = "verde"
		break;
		case 4:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player_pretobranco;
			}
			global.cor_player = "pretobranco"
		break;
		case 5:
			if (instance_exists(_nave_GUI))
			{
				_nave_GUI.sprite_index = spr_player_clone;
			}
			global.cor_player = "ciano"
		break;
	}
}

#endregion
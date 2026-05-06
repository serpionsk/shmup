#region variaveis
//velocidade do player
vel = 2

//tempo de espera para atirar novamente
espera_tiro = 20;
//valor que permite atirar ou não se esta zerado
timer_tiro = 0
//valor que define level do tiro
level_tiro = 1;
//
max_level_tiro = 3
#endregion

#region metodos
//função que controla o player por codigo
controla_player = function()
{
	var _cima, _baixo, _dire, _esq, _atirar;	
	
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_dire = keyboard_check(ord("D")) or keyboard_check(vk_right);
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	//movimentação horizontal
	var _velh = (_dire - _esq) * vel;
	x += _velh;
	
	//clamp= delimita um valor "no caso o X" a ficar dentro do range de
	// 2 numeros "no caso entre o começo e final da tela"
	// room width = largura da tela
	// sprite width/2 = largura da sprite dividido para 2 (metade do tamanho)
	x = clamp(x, (sprite_width/2), room_width - (sprite_width/2))
	
	//movimentação vertical
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	//o mesmo com o Y, mas ao inves de largura eu pego a altura de referencia
	y = clamp(y, (sprite_height/2), room_height - (sprite_height/2))
	
	//diminui o timer do tiro ao executar a propria função do tiro
	timer_tiro--;
	
	//se atirar e o timer tiro forem true
	if (_atirar and timer_tiro <=0)
	{
		if (level_tiro == 1)
		{
			tiro_1();
		}
		else if (level_tiro == 2)
		{
			tiro_2();
		}
		else if (level_tiro == 3)
		{
			tiro_3();
		}
		timer_tiro = espera_tiro;
	}
	
	if (keyboard_check_pressed(ord("O")))
	{
		level_tiro ++;
	}
	if (keyboard_check_pressed(ord("L")))
	{
		level_tiro --;
	}
}

//metodos de tiro

tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro);
	_tiro.vspeed = -10;
}

tiro_2 = function()
{
	var _tiro = instance_create_layer(x-10, y, "Projetil", obj_tiro);
	_tiro.vspeed = -10;
	_tiro = instance_create_layer(x+10, y, "Projetil", obj_tiro);
	_tiro.vspeed = -10;	
}
tiro_3 = function()
{
	tiro_1();
	tiro_2();
}
ganha_level = function()
{
	if (level_tiro >= max_level_tiro) exit
	level_tiro++;
}
#endregion
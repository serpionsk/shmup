



#region variaveis


//velocidade do player
vel = 2


//tempo de espera para atirar novamente
espera_tiro = 18;
//valor que permite atirar ou não se esta zerado
timer_tiro = 0
//valor que define level do tiro
level_tiro = 1;
//numero maximo do nivel de tiro
max_level_tiro = 3


//vidas
vidas = 3;
//escudos
escudos = 5;
//variavel que guarda as informações do meu escudo
meu_escudo = noone;
//variavel que permite o player levar dano, se caso não estiver invencivel
invencivel = false;
//segundos de invencibilidade
segundos_invencivel = 2;


//inicia a alteraçãop nas escalas visuais do efeito mola(sem alterar colisao)
inicia_efeito_mola();


//variavel que checa se tomei dano ou não (0 = não)
inicia_efeito_dano();


#endregion


#region metodos
//função que controla o player por codigo
controla_player = function()
{
	var _cima, _baixo, _dire, _esq, _atirar, _enter, _e;	
	
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_dire = keyboard_check(ord("D")) or keyboard_check(vk_right);
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	
	//movimentação horizontal
	var _velh = (_dire - _esq) * vel;
	x += _velh;
		
	//movimentação vertical
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	
	
	//diminui o timer do tiro ao executar a propria função do tiro
	timer_tiro--;
	
	
	//se atirar e o timer tiro forem true
	if (_atirar and timer_tiro <=0)
	{
		audio_stop_sound(sfx_shoot1);
		snd_effect(sfx_shoot1);
		//instancia a função do efeito mola (x, y)
		efeito_mola(2, .8);
		
		if (level_tiro == 1)
		{
			tiro_1();
		}
		timer_tiro = espera_tiro;
	}

}

//metodos de tiro
tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Projetil", obj_tiro);
}

#endregion
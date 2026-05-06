//funcao de movimentacao e tiro do player
controla_player();

if (keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}

if instance_exists(meu_escudo)
{
	meu_escudo.x = x;
	meu_escudo.y = y;
}
else
{
	meu_escudo = noone;
}
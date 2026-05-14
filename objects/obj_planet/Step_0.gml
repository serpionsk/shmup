switch(global.setaatual)
{
	//seleciona o primeiro
	case 0:
		SetDir_planet.sprite_index = spr_seta_direita_red
		SetEsq_planet.sprite_index = spr_seta_esquerda_red
	break;
	//seleciona outra coisa
	case 1:
		SetDir_planet.sprite_index = spr_seta_direita
		SetEsq_planet.sprite_index = spr_seta_esquerda
	break;
}

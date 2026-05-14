switch(global.setaatual)
{
	//seleciona o primeiro
	case 0:
		SetDir_nave.sprite_index = spr_seta_direita
		SetEsq_nave.sprite_index = spr_seta_esquerda
	break;
	//seleciona outra coisa
	case 1:
		SetDir_nave.sprite_index = spr_seta_direita_red
		SetEsq_nave.sprite_index = spr_seta_esquerda_red
	break;
}

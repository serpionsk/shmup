var _viewport = room_get_viewport(rm_jogo, 0);

if (global.debug)
{
	draw_text(20, 20, "Level do tiro: " + string(level_tiro));
	//draw_text(5, _Ypos - 30, "Vidas: ");
}
//desenhando icones com metodos
desenha_icone(spr_life_GUI, vidas, _viewport[4]);
desenha_icone(spr_shield_GUI, escudos, _viewport[4]-30);




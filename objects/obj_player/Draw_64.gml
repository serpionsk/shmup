var _viewport = room_get_viewport(rm_jogo, 0);
var _Ypos = _viewport[4];
var _space_sprite = sprite_get_width(spr_life_GUI)
var _hp = spr_life_GUI;
var _max_space = clamp(28, 0, 28)

show_debug_message(_space_sprite)
if (!global.debug)
{
	draw_text(20, 20, "Level do tiro: " + string(level_tiro));
	//draw_text(5, _Ypos - 30, "Vidas: ");
	repeat(vidas)
	{
		draw_sprite_ext(_hp, 0, _space_sprite, _Ypos  - 20, 1, 1, 0, c_white, 0.5);
		_space_sprite += _max_space
		
	}
}





draw_set_valign(1);
draw_set_font(fnt_space);

for (var i = 0; i < array_length(menu) ; i++)
{
	var _cor = c_white
	
	if (i == atual)
	{
		_cor = c_red;
	}
	
	draw_set_colour(_cor)
	draw_text(x, viewHei+i*20, menu[i]);
	draw_set_colour(-1)
	
}

draw_set_valign(0);
draw_set_font(-1);
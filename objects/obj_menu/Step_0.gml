
if (keyboard_check_pressed(vk_down))
{
	atual += 1;
}
if (keyboard_check_pressed(vk_up))
{
	atual -= 1;
}

atual = clamp(atual, 0, array_length(menu)-1)
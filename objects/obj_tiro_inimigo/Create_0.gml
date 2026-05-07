vspeed += 1;

morrendo = function()
{
	instance_destroy();
	instance_create_layer(x, y, layer, obj_explosao_tiro);
}
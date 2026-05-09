if (y < -30)
{
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

vspeed = lerp(vspeed, -10, .5);
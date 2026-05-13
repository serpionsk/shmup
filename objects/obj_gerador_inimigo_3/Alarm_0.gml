randomise();

//X aleatorio:
var _random_nave1 = random_range(30, 100);
var _random_nave2 = random_range(200, 255);
var _Yrandom = random_range(-100, -150);
var _Yrandom2 = random_range(-200, -220);

instance_create_layer(_random_nave1, _Yrandom, "Inimigos", obj_inimigo3);
instance_create_layer(_random_nave2, _Yrandom2, "Inimigos", obj_inimigo3);

if (global.gamemode == "easy")
{
	alarm [0] = game_get_speed(gamespeed_fps) * timer_inimigo3;
}
else
{
	alarm[1] = game_get_speed(gamespeed_fps) * 1
}



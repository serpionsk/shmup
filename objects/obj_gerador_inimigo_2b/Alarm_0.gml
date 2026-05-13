randomise();
var _inimigoX = [(room_width/2)-400, (room_width/2)+400]

instance_create_layer(choose(_inimigoX[0], _inimigoX[1]), 25, "Inimigos", obj_inimigo2);

if (global.gamemode == "easy")
{
	alarm [0] = game_get_speed(gamespeed_fps) * timer_inimigo2;
}
if (global.gamemode == "hard")
{
	alarm[1] = game_get_speed(gamespeed_fps) * 1
}



randomise();
instance_create_layer(x+200, y, "Inimigos", obj_inimigo2H);
instance_create_layer(x+250, y, "Inimigos", obj_inimigo2H);

if (global.gamemode == "easy")
{
	alarm [0] = game_get_speed(gamespeed_fps) * timer_inimigo2;
}
if (global.gamemode == "hard")
{
	alarm[1] = game_get_speed(gamespeed_fps) * timer_inimigo2hard
}



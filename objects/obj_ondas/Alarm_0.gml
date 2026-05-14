
if (onda_atual < array_length(ondas))
{
	if (global.gamemode = "easy")
	{
		layer_sequence_create("Seq_inimigos", 0, 0, ondas[onda_atual]);
		alarm[0] = game_get_speed(gamespeed_fps)*6;
		onda_atual = irandom_range(0, 2);
	}
	else if (global.gamemode = "hard")
	{
		layer_sequence_create("Seq_inimigos", 0, 0, ondas_hard[onda_atual]);
		alarm[0] = game_get_speed(gamespeed_fps)*6;
		onda_atual = irandom_range(0, 2);
	}
}
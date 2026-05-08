
if (onda_atual < array_length(ondas)-1)
{
	layer_sequence_create("Seq_inimigos", 0, 0, ondas[onda_atual]);
	alarm[0] = game_get_speed(gamespeed_fps)*3;
	onda_atual++;
}
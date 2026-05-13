
if (onda_atual < array_length(ondas))
{
	layer_sequence_create("Seq_inimigos", 0, 0, ondas[onda_atual]);
	alarm[0] = game_get_speed(gamespeed_fps)*10;
	onda_atual = irandom_range(0, 2);
}
if (onda_atual < array_length(ondas))
{
	onda_atual = 0;
}


if (global.pontos < 100)
{
	global.gamemode = "easy";
}
else
{
	global.gamemode = "hard";
}
	
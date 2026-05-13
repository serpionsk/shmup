if (global.gamemode == "hard")
{
	timer_inimigo2 = 0;
	if (instance_exists(obj_inimigo2))
	{
		instance_destroy(obj_inimigo2)
	}
}

if (global.pontos < 70)
{
	timer_inimigo2 = 15
}
else
{
	timer_inimigo2 = 7
}
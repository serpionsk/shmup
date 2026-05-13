if (global.gamemode == "hard")
{
	timer_inimigo3 = 0;
	if (instance_exists(obj_inimigo3))
	{
		instance_destroy(obj_inimigo3)
	}
}

if (global.pontos < 70)
{
	timer_inimigo3 = 15
}
else
{
	timer_inimigo3 = 7
}
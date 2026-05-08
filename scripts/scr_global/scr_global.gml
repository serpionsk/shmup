#region Variáveis globais
global.debug = false;

#endregion

#region Funções
function destroi_unidade(_animacao = obj_explosao_tiro)
{
	instance_destroy();
	instance_create_layer(x, y, "Particles", _animacao);
}

function screanshake(_shake = 0)
{
	if (instance_exists(obj_screanshake))
	{
		obj_screanshake.treme = _shake;
	}
}

#endregion
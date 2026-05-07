#region Variáveis globais
global.debug = false;

#endregion

#region Funções
function destroi_unidade(_animacao = obj_explosao_tiro)
{
	instance_destroy();
	instance_create_layer(x, y, "Particles", _animacao);
}

#endregion
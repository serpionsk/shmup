if (!in_sequence && estou_em_sequencia)
{
	instance_destroy();
}

desfaz_efeito_mola();

timer_efeito_dano();
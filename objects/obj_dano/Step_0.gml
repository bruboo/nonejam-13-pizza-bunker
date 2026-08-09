timer_dano--;

if (timer_dano <= 0)
{
	var _inimigo = instance_place(x, y, obj_entidade_inimigo);

	if (_inimigo != noone)
	{
		_inimigo.toma_dano(dano, 0, 0);
		timer_dano = intervalo_dano;
	}
}
if (!instance_exists(obj_player))
{
	instance_destroy();
	return;
}

angulo += vel_giro;
image_angle += vel_orbita;

var _angulo = angulo + (360 / qtd_orbita) * indice;

x = obj_player.x + lengthdir_x(distancia, _angulo);
y = obj_player.y + lengthdir_y(distancia, _angulo);

timer_dano--;

if (timer_dano <= 0)
{
	var _inimigo = instance_place(x, y, obj_entidade_inimigo);

	if (_inimigo != noone)
	{
		_inimigo.toma_dano(0, 0, 0);
		timer_dano = intervalo_dano;
	}
}
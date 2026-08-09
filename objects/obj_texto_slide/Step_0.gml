switch (estado)
{
	case 0:
		x = lerp(x, 0, vel_entrada);

		if (abs(x) <= 1)
		{
			x = 0;
			estado = 1;
			timer = tempo_espera;
		}
	break;

	case 1:
		timer--;

		if (timer <= 0)
		{
			estado = 2;
		}
	break;

	case 2:
		x = lerp(x, display_get_gui_width(), vel_saida);

		if (x >= display_get_gui_width() - 1)
		{
			instance_destroy();
		}
	break;
}
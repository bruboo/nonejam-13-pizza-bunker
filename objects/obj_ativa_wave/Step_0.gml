pode_ativar = false;

if(instance_exists(obj_player))
{
	var _dist = point_distance(x,y,obj_player.x,obj_player.y);

	if(_dist <= dist_interacao)
	{
		pode_ativar = true;
	}
}


if(pode_ativar)
{
	if(point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		if(mouse_check_button_pressed(mb_left))
		{
			if(instance_exists(obj_wave))
			{
				with(obj_loja)
				{
					estado = "fechada";
				}
				obj_wave.voltar_wave();
				instance_destroy();
			}
		}
	}
}

if(estado == "aberta")
{
	sprite_index = spr_loja;
	
	if(place_meeting(x,y,obj_player))
	{
		global.bloquear_ataque = true;
		if(!instance_exists(obj_upgrades_loja))
		{
			instance_create_layer(mouse_x,mouse_y,"Instances",obj_upgrades_loja);
		}
	
	}
	else if(!place_meeting(x,y,obj_player))
	{
		if (instance_exists(obj_upgrades_loja))
	    {
	        with (obj_upgrades_loja)
	        {
	            saindo = true;
	        }
	    }
	}
	sinaliza_frame += sinaliza_speed;

	if(sinaliza_frame >= sprite_get_number(spr_loja_sinaliza))
	{
		sinaliza_frame = 0;
	}
}
if(estado == "fechada")
{
	sprite_index = spr_loja_1;
	if(instance_exists(obj_upgrades_loja))
	{
		with(obj_upgrades_loja)
		{
			saindo = true;
		}
	}
}


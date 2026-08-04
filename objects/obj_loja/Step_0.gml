if(place_meeting(x,y,obj_player))
{
	global.bloquear_ataque = true;
	var _loja = instance_exists(obj_upgrades_loja)
	if(!_loja )
	{	
		instance_create_layer(mouse_x,mouse_y,layer,obj_upgrades_loja)
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

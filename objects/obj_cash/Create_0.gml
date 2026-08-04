velh = 0;
velv = 0;
vel = 1;
vel_max = 40;
estado = "drop";

controla_drop = function()
{
	switch(estado)
	{
		case "drop":
		{
			var _dist = point_distance(x,y,obj_player.x,obj_player.y);
			
			if(_dist <= 120)
			{
				estado = "coleta";
			}

		}
		break;
		
		case "coleta":
		{
			var _dir = point_direction(x,y,obj_player.x,obj_player.y);
			vel = lerp(vel, vel_max, 0.03);
			velh = lengthdir_x(vel, _dir);
			velv = lengthdir_y(vel, _dir);
			y+= velv;
			x+= velh;
				
		}
	
	}
			
		
}
	
	
	
	

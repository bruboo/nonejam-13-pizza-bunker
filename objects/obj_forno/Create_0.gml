event_inherited();

sprites = [
			//sprites 
			[spr_forno]	
		  ];


//pizza_tocou = false;
//multiplicador de dano do forno
dano = 4;
//velocidade q empurra a pizza
poder = 6;
//tempo de vida da pizza adicionado
timer_boost = 80;

estado_base = function()
{
	if (estado_txt != "base")
	{
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "base";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	image_xscale = lerp(image_xscale, 1, 0.15);
	image_yscale = lerp(image_yscale, 1, 0.15);
	
	var _pizza = instance_place(x, y, obj_pizza_prime);

	if (_pizza != noone)
	{
		if(_pizza.ultimo_forno != id)
		{
			create_part(3,10,25,x,y,_pizza.velh,_pizza.velv);
			image_xscale = 1.5;
			image_yscale = 1.5;
			_pizza.forno_mod_dano = dano;
			_pizza.tempo_pizza += timer_boost;
			_pizza.fornos_batidos++;
			_pizza.lista_inimigos = [];
		    _pizza.ultimo_forno = id;
			_pizza.estado = _pizza.estado_pronta;
			_pizza.tempo_pizza = 60;
		    // direção saindo do forno
		    var dir = point_direction(x, y, _pizza.x, _pizza.y);

		    // velocidade atual
		    var vel = point_distance(0, 0, _pizza.velh, _pizza.velv);

		    // muda direção
		    _pizza.velh = lengthdir_x(vel, dir);
		    _pizza.velv = lengthdir_y(vel, dir);


			// checa a velocidade atual após o ricochete
			var check_vel = point_distance(0, 0, _pizza.velh, _pizza.velv);

			// procura o inimigo mais próximo 
	        var alvo = instance_nearest(x, y, obj_entidade_inimigo);

	        if (alvo != noone && point_distance(x, y, alvo.x, alvo.y) <= 250)
	        {
	            // lança na direção do inimigo
	            var dir_alvo = point_direction(x, y, alvo.x, alvo.y);

	           _pizza.velh = lengthdir_x(check_vel + poder, dir_alvo);
	           _pizza.velv = lengthdir_y(check_vel + poder, dir_alvo);
	        }
	        else
	        {
			    // força do forno
			    _pizza.velh += lengthdir_x(poder, dir);
			    _pizza.velv += lengthdir_y(poder, dir);
			}
		}
	}
	//molde de saida do estado
	
	//if ()
	//{
	
	//	estado  = proximo estado;
	//}
}

estado = estado_base;
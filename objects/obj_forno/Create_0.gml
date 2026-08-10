event_inherited();

sprites = [
			//sprites 
			[spr_forno]	
		  ];


//pizza_tocou = false;
//multiplicador de dano do forno
dano = 2;
//dano do forno
dano_base = 5;
//velocidade q empurra a pizza
poder = 5;
//tempo de vida da pizza adicionado
timer_boost = 80;



//upgrades
forno_xplode = function()
{
	if (!global.forno_xplode_ativo) return;
	var _rastro = instance_create_layer(x,y-14,"Instances",obj_forno_explode);
	_rastro.image_alpha = 0;
	var _boom = instance_create_layer(x,y-40,"Instances",obj_effect_anim);
	_boom.sprite_index = spr_explode_forno_area;
}
forno_sniper = function(_pizza, check_vel, alvo, dir)
{
		// procura o inimigo mais próximo 
			if (alvo != noone && point_distance(x, y, alvo.x, alvo.y) <= 5000)
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
forno_pizza_extra = function(_pizza)
{
	if (!global.pizza_extra_ativa) return;
	var _nova_pizza = instance_create_layer(x,y-14,"Instances",obj_pizza_extra);

	_nova_pizza.dano_base = _pizza.dano_base;
	_nova_pizza.forno_mod_dano = 1;

	var _dir = random(360);

	_nova_pizza.velh = lengthdir_x(_nova_pizza.vel,_dir);
	_nova_pizza.velv = lengthdir_y(_nova_pizza.vel,_dir);
};

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
	
	var _pizza = instance_place(x, y, obj_pizza_mae);

	if (_pizza != noone)
	{
		if(_pizza.ultimo_forno != id)
		{
			_pizza.ultimo_forno = id;
			create_part(0,30,60,x,y-14,0,0);
			scpt_audio_play_sound(snd_forno);
			image_xscale = 1.5;
			image_yscale = 1.5;
			forno_xplode();
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
			
			if (_pizza.pode_gerar_extra && global.pizza_extra_ativa)
			{
				forno_pizza_extra(_pizza);
			}
			
		

	        if (global.forno_sniper_ativo)
			{
				forno_sniper(_pizza, check_vel, alvo, dir);
			}
			else
			{
				if (alvo != noone && point_distance(x, y, alvo.x, alvo.y) <= 250)
				{
					var _dir_alvo = point_direction(x, y, alvo.x, alvo.y);

					_pizza.velh = lengthdir_x(check_vel + poder, _dir_alvo);
					_pizza.velv = lengthdir_y(check_vel + poder, _dir_alvo);
				}
				else
				{
					_pizza.velh += lengthdir_x(poder, dir);
					_pizza.velv += lengthdir_y(poder, dir);
				}
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
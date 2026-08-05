
velh = 0;
velv = 0;
//sprite que será desenhada
sprite = sprite_index;

//texto debug
estado_txt = "";

//Sprites que vão ser usadas no objeto
sprites = [
			//sprites parado
			[sprite_index]
			
		  ];

//linha do vetor sprites
sprites_index = 0;
//coluna do vetor sprites
face = 0;
//imagem atual da sprite
image_ind = 0;
//velocidade da animaçao
image_spd = 10/ 60;

//quantidade de imagens na sprite
image_numb = sprite_get_number(sprite);
//não precisa existir
troquei = false;

//função para simplificar a troca de sprites
ajusta_sprite = function(_indice_array)
{
	//Checando se a sprite que eu estou usando é a que eu deveria estar usando
	
	if (sprite != sprites[_indice_array][face])
	{
		//acabei de entrar no estado
		//Garantindo que a animação começa do começo
		image_ind = 0;
	}
	
	//Aplicando a sprite correta
	sprite = sprites[_indice_array][face];
	
	//Descobrindo o image number da sprite que eu to usando
	image_numb = sprite_get_number(sprite);
	
	//Aumentando o valor do image_ind com base na image spd
	image_ind += image_spd;
	
	//Zerando a image_ind depois da animação acabar
	image_ind %= image_numb;
}


vida = 2;



_obj_colision = [];
vel = 0.5;
dir_mov = 0;


//texto debug
estado_txt = "";
estado			= noone;



toma_dano = function(_velv = 0,_velh = 0,_dano_base = 0)
{		
	
		var _dano_bonus = instance_exists(obj_player) ? obj_player.dano_bonus : 0;
		vida -= _dano_base + _dano_bonus;
		var _popup = instance_create_layer(x + random_range(-6,6), bbox_top - 8 + random_range(-2,2), "Brilho", obj_popup);
		_popup.valor = _dano_base + _dano_bonus;
		create_part(0,10,25,x,y,_velh,_velv);
	    create_part(4,10,25,x,y,_velh,_velv);
		image_xscale = 1.8;
		image_yscale = 1.8;
	
		
		if(vida <= 0)
		{
			instance_create_layer(x,y,layer,obj_experiencia);
			instance_create_layer(x,y,layer,obj_cash);
			instance_destroy();
		}
}

calcula_movimento = function()
{
	velh = lengthdir_x(vel, dir_mov);
	velv = lengthdir_y(vel, dir_mov);

	var _lista = ds_list_create();

	collision_circle_list(x, y, 48, obj_entidade_inimigo, false, true, _lista, true);

	for (var i = 0; i < ds_list_size(_lista); i++)
	{
		var _inimigo = _lista[| i];

		if (_inimigo != id)
		{
			var _dist = point_distance(x, y, _inimigo.x, _inimigo.y);

			if (_dist < 32)
			{
				var _dir = point_direction(_inimigo.x, _inimigo.y, x, y);
				var _forca = (60 - _dist) * 0.08;

				velh += lengthdir_x(_forca, _dir);
				velv += lengthdir_y(_forca, _dir);
			}
		}
	}

	ds_list_destroy(_lista);

	move_and_collide(velh, velv, obj_player);
}



estado_parado = function()
{
	if (estado_txt != "parado")
	{		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		image_xscale = 1.5;
		image_yscale = 1.5;
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "parado";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
	
			var _alvo = obj_player;
			
			if(!instance_exists(_alvo))estado = "comemora";
			
			var _dist = point_distance(x,y,_alvo.x,_alvo.y);

			if(_dist >= 36)
			{				
				estado = estado_segue;
			}
	
	
	
}
estado_segue = function()
{
	if (estado_txt != "segue")
	{		
		image_xscale = 1.5;
		image_yscale = 1.5;
		sprites_index = 0;
		estado_txt = "segue";
	}

	ajusta_sprite(sprites_index);

	var _alvo = obj_player;

	if(!instance_exists(_alvo))
	{				
		estado = estado_comemora;
		return;
	}
	
	var _dist = point_distance(x,y,_alvo.x,_alvo.y);
	dir_mov = point_direction(x,y,_alvo.x,_alvo.y);
	calcula_movimento();
	
	if(_dist <= 36)
	{
		estado = estado_parado;
	}
}

estado_comemora = function()
{
	if (estado_txt != "comemora")
	{		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		image_xscale = 1.5;
		image_yscale = 1.5;
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "comemora";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);


}

estado = estado_parado;








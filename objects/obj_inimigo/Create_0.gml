event_inherited();

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



_obj_colision = [obj_colisor,obj_inimigo]
vel = 2;


//texto debug
estado_txt = "";
estado			= noone;



toma_dano = function(_velv = 0,_velh = 0,_dano_base = 0)
{	
		create_part(0,10,25,x,y,_velh,_velv);
	    create_part(4,10,25,x,y,_velh,_velv);
		image_xscale = 1.8;
		image_yscale = 1.8;
		var _dano_bonus = instance_exists(obj_player) ? obj_player.dano_bonus : 0;
		vida -= _dano_base + _dano_bonus;
		
		
		if(vida <= 0)
		{
			instance_create_layer(x,y,layer,obj_experiencia)
			instance_destroy();
		}
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
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		image_xscale = 1.5;
		image_yscale = 1.5;
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "segue";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
			var _alvo = obj_player;

			if(!instance_exists(_alvo))
			{				
				estado = estado_comemora;
			}
			
			var _dir = point_direction(x,y,_alvo.x,_alvo.y);
			
			var _dist = point_distance(x,y,_alvo.x,_alvo.y);
			
			
			velh = lengthdir_x(vel,_dir);
			velv = lengthdir_y(vel,_dir);
			
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








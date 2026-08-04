// Inherit the parent event
event_inherited();


sprites = [
			//sprites 
			[spr_pizza]	
		  ];

velh = 0;
velv = 0;
vel = 12;


//salvando a velocidade da pizza
//por causa do pause
velov_save = 0;
veloh_save = 0;



//tempo q a pizza dura
tempo_pizza = 40;

//porradas q a pizza aguenta
fornos_batidos = 0;
limite_de_fornos = obj_player.res_pizza;

//salva o ultimo forno q a pizza bateu
ultimo_forno = noone;

dano_base = 1;

//pega os inmigos q acerta
lista_inimigos = []


destroi_pizza = function()
{
	tempo_pizza--;
	if(tempo_pizza <= 0) 
	{
		
		instance_destroy();
	}
}




//estado base, como sai da mao do player
estado_crua = function()
{
	if (estado_txt != "crua")
	{
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "crua";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
	destroi_pizza();
	var _inimigo = instance_place(x, y, obj_inimigo);

	if (_inimigo != noone)
	{
		
		_inimigo.toma_dano(velv,velh,dano_base);

	    // destrói apenas se ainda não bateu em nenhum forno
	    if (fornos_batidos <= 0)
	    {
	        instance_destroy();
	    }
	}
	//molde de saida do estado
	
	//if ()
	//{
	
	//	estado  = proximo estado;
	//}
}

estado_pronta = function()
{
	if (estado_txt != "pronta")
	{
		
		image_blend = c_black;
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		image_xscale = 1.5;
		image_yscale = 1.5;
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "pronta";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	destroi_pizza();
	
	var _inimigo = instance_place(x, y, obj_inimigo);

	if (_inimigo != noone )
	{
		if(!array_contains(lista_inimigos,_inimigo.id))
		{
		
		    // a pizza tocou no inimigo		
			array_push(lista_inimigos,_inimigo.id)
			_inimigo.toma_dano(velv,velh,dano_base);
		}
	}
	
			if (fornos_batidos >= limite_de_fornos)
		    {
		        instance_destroy();		
		    }
	
			var vel_max = 25;

			var _velocidade = point_distance(0,0,velh,velv);

			if (_velocidade > vel_max)
			{
			    var dir = point_direction(0,0,velh,velv);

			    velh = lengthdir_x(vel_max,dir);
			    velv = lengthdir_y(vel_max,dir);
			}
	
	//molde de saida do estado
	
	//if ()
	//{
	
	//	estado  = proximo estado;
	//}
}




estado = estado_crua;
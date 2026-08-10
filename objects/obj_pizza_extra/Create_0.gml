// Inherit the parent event
event_inherited();


sprites = [
			//sprites 
			[spr_pizza,spr_pizza_fogo,spr_pizza_kika]	
		  ];

velh = 0;
velv = 0;
vel = 12;
pode_gerar_extra = false;

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

//dano base da pizza
dano_base = obj_player.dano_bonus;

//dano q vem do forno
forno_mod_dano = 0;

//pega os inmigos q acerta
lista_inimigos = []


destroi_pizza = function()
{
	tempo_pizza--;
	if(tempo_pizza <= 0) 
	{
		create_part(5,15,20,x,y,0,0);
		instance_destroy();
	}
}


estado_pronta = function()
{
	if (estado_txt != "pronta")
	{
		dano_base = dano_base * forno_mod_dano; 
		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		image_xscale = 2;
		image_yscale = 2;
		//Mudando a sprite
		sprites_index = 0;
		face = 1;
		estado_txt = "pronta";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	destroi_pizza();
	pizza_slow();
	
	
	image_angle = point_direction(0, 0, velh, velv) + 90;
	var _inimigo = instance_place(x, y, obj_entidade_inimigo);

	if (_inimigo != noone )
	{
		if(!array_contains(lista_inimigos,_inimigo.id))
		{
		
		    // a pizza tocou no inimigo		
			array_push(lista_inimigos,_inimigo.id)
			pizza_xplode();
			pizza_de_fogo(_inimigo);
			_inimigo.toma_dano(velv,velh,dano_base);
			scpt_audio_play_sound(snd_dano)
			
		}
	}
	
			if (fornos_batidos >= limite_de_fornos)
		    {
				create_part(5,8,10,x,y,0,0);
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




estado = estado_pronta;
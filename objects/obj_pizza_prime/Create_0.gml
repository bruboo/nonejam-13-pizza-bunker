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

//vendo se ja bateu naquele inimigo nessa reta
pode_dar_dano = true;

//tempo q a pizza dura
tempo_pizza = 40;

//porradas q a pizza aguenta
fornos_batidos = 0;
limite_de_fornos = obj_player.res_pizza;

dano_base = 1;









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
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "pronta";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
	
	//molde de saida do estado
	
	//if ()
	//{
	
	//	estado  = proximo estado;
	//}
}




estado = estado_crua;
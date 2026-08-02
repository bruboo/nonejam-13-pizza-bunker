delay_wave = 150;
timer_wave = delay_wave;

// Área onde os inimigos podem nascer
area_x = 90;
area_y = 100;

area_largura = 1250;
area_altura = 800;

tempo_jogo = 0;

estado = "facil";


spawn_x = [
    1398, // direita
    96, // esquerda
    754,  // cima
    754   // baixo
];


spawn_y = [
    490,  // direita
    490,  // esquerda
    96, // cima
    864   // baixo
];

// último spawn usado
ultimo_spawn = -1;

criar_inimigo = function()
{
    var pos = irandom(3);
	
	// evita nascer no mesmo lugar duas vezes seguidas
    while(pos == ultimo_spawn)
    {
        pos = irandom(3);
    }

    ultimo_spawn = pos;


    instance_create_layer(
        spawn_x[pos],
        spawn_y[pos],
        layer,
        obj_inimigo
    );
    
   
}











controla_estado = function()
{
	switch(estado)
	{
		
		case "facil":
		{
			timer_wave--;
			if(timer_wave <= 0)
			{
				criar_inimigo();
				timer_wave = delay_wave;
			}
			
			//if(tempo_jogo >= 30)
			//{
			//	estado = "medio";
			//}
			
			
		}
			break;
			
		 case "medio":
		 {
			 timer_wave--;
			if(timer_wave <= 0)
			{
				criar_inimigo();
				timer_wave = 75;
			}
			
			if(tempo_jogo >= 60)
			{
				estado = "dificil";
			}
		 }
		 break;
		 
		  case "dificil":
		 {
			  timer_wave--;
			if(timer_wave <= 0)
			{
				criar_inimigo();
				timer_wave = 30;
			}
			if(tempo_jogo >= 90)
			{
				estado = "impossivel";
			}
			
			
		 }
		 break;
		 
		 case "impossivel":
		{
			timer_wave--;
			if(timer_wave <= 0)
			{
				criar_inimigo();
				timer_wave = 8;
			}
			
			
			
			
		}
			break;
			
	}
	
}
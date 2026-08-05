
	if(global.parar)
	{
		//velh = veloh_save; velv = velov_save;
		veloh_save = velh; velov_save = velv;
		return;
	}
	


//calcula cada passo q a pizza anda 
var passos = ceil(max(abs(velh), abs(velv)));

if (passos < 1)
{
    passos = 1;
}


//colisao da pizza
repeat(passos)
{
    var mov_x = velh / passos;
    var mov_y = velv / passos;



    // Horizontal
    if (place_meeting(x + mov_x, y, obj_colisor))
    {
		create_part(1,10,15,x,y,velh,velv);
        velh = -velh;
        mov_x = velh / passos;
		pode_dar_dano = true;
    
    }


    // Vertical
    if (place_meeting(x, y + mov_y, obj_colisor))
    {
		create_part(1,10,15,x,y,velh,velv);
        velv = -velv;
        mov_y = velv / passos;
		pode_dar_dano = true;
    }


    // Move a bola
    x += mov_x;
    y += mov_y;

	
	
	
	// colisão com inimigo
	var inimigo = instance_place(x, y, obj_entidade_inimigo);

	if (inimigo != noone && pode_dar_dano)
	{
		
	    // a pizza tocou no inimigo
		pode_dar_dano = false;
	    inimigo.pizza_tocou = true;
		create_part(0,10,25,x,y,velh,velv);
	    create_part(4,10,25,x,y,velh,velv);
	    inimigo.image_xscale = 1.8;
		inimigo.image_yscale = 1.8;
		inimigo.vida -= dano_base + obj_player.dano_bonus;


	    // destrói apenas se ainda não bateu em nenhum forno
	    if (fornos_batidos <= 0)
	    {
	        instance_destroy();
	    }
	}




   //colisao com o forno
    var col = instance_place(x, y, obj_forno);


    if (col != noone)
    {
		col.pizza_tocou = true;
		
		create_part(3,10,25,x,y,velh,velv);
		
		col.image_xscale = 1.5;
		col.image_yscale = 1.5;
		
		fornos_batidos++;
		 // se bateu em 4 fornos
	    if (fornos_batidos >= limite_de_fornos)
	    {
	        instance_destroy();
			exit;
	    }
		
		
        //nova velocidade da pizza
        var novox = x - col.x;
        var novoy = y - col.y;
		

        var len = point_distance(x, y, col.x, col.y);


        if (len > 0)
        {
            novox /= len;
            novoy /= len;


            // joga a bola de volta
			//isso aqui é um loop
            while (place_meeting(x, y, obj_forno))
            {
							
                x += novox;
                y += novoy;
            }

			//quicada
            var dot = velh * novox + velv * novoy;


            velh -= 2 * dot * novox;
            velv -= 2 * dot * novoy;
			
			pode_dar_dano = true;
			
			
			// pega a força do forno que bateu
			tempo_pizza += col.timer_boost;
			
			
			// checa a velocidade atual após o ricochete
			var check_vel = point_distance(0, 0, velh, velv);

			// procura o inimigo mais próximo 
	        var alvo = instance_nearest(col.x, col.y, obj_entidade_inimigo);

	        if (alvo != noone && point_distance(col.x, col.y, alvo.x, alvo.y) <= 200)
	        {
	            // lança na direção do inimigo
	            var dir_alvo = point_direction(col.x, col.y, alvo.x, alvo.y);

	            velh = lengthdir_x(check_vel + col.poder, dir_alvo);
	            velv = lengthdir_y(check_vel + col.poder, dir_alvo);
	        }
	        else
	        {
	            // comportamento normal
	            velh += novox * col.poder;
	            velv += novoy * col.poder;
	        }
			
			
			
		
			// limite de velocidade
			var vel_max = 30;

			var _velocidade = point_distance(0,0,velh,velv);

			if (_velocidade > vel_max)
			{
			    var dir = point_direction(0,0,velh,velv);

			    velh = lengthdir_x(vel_max,dir);
			    velv = lengthdir_y(vel_max,dir);
			}
			image_blend = c_black;
        }
    }
}




tempo_pizza--;

if(tempo_pizza <= 0) instance_destroy();








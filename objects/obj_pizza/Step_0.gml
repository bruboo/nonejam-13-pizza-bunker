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

	//ve se bateu na parede e tal
    var bateu = false;
	


    // Horizontal
    if (place_meeting(x + mov_x, y, obj_colisor))
    {
		create_part(1,10,15,x,y,velh,velv);
        velh = -velh;
        mov_x = velh / passos;
		
        bateu = true;
    }


    // Vertical
    if (place_meeting(x, y + mov_y, obj_colisor))
    {
		create_part(1,10,15,x,y,velh,velv);
        velv = -velv;
        mov_y = velv / passos;
		
        bateu = true;
    }


    // Move a bola
    x += mov_x;
    y += mov_y;

	
	
	
	// colisão com inimigo
	var inimigo = instance_place(x, y, obj_inimigo);

	if (inimigo != noone)
	{
	    // a pizza tocou no inimigo
	    inimigo.pizza_tocou = true;
		create_part(0,10,25,x,y,velh,velv);
	    create_part(4,10,25,x,y,velh,velv);
	    inimigo.image_xscale = 1.8;
		inimigo.image_yscale = 1.8;
		inimigo.vida -= dano;
	    // destrói o inimigo
	    //instance_destroy(inimigo);

	    // ou destrói a pizza se quiser
	    instance_destroy();
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


            var dot = velh * novox + velv * novoy;


            velh -= 2 * dot * novox;
            velv -= 2 * dot * novoy;
			
			
			
			// pega a força do forno que bateu
			tempo_pizza += col.timer_boost;
	        velh += novox * col.poder;
	        velv += novoy * col.poder;
			
			// limite de velocidade
			var vel_max = 30;

			var velocidade = point_distance(0,0,velh,velv);

			if (velocidade > vel_max)
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








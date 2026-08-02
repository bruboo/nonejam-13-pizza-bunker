// Inherit the parent event
event_inherited();
if(global.parar)
{
	velh = 0;
	velv = 0;
	return;
}
controla_estado();



image_xscale = lerp(image_xscale, 1, 0.15);
image_yscale = lerp(image_yscale, 1, 0.15);

if(vida <= 0)
{
	instance_create_layer(x,y,layer,obj_experiencia)
	instance_destroy();
}


// colisão com player
var player = instance_place(x, y, obj_player);

if (player != noone)
{
	
	if(obj_player.timer_invencivel<= 0)
	{
	    // a pizza tocou no player
	    player.toma_dano = true;
		flash(c_red);
		player.timer_invencivel = 20;
		player.vida -= 1;
		image_xscale = 1.5;
		image_yscale = 1.5;
	    create_part(0,10,25,x,y,velh,velv);
		create_part(2,10,25,x,y,velh,velv);
		
	}

    // destrói o player
    //instance_destroy(inimigo);

   
}





//Colisão horizontal
if (place_meeting(x + velh, y, _obj_colision))
{
	//Pegando o sinal da velocidade horizontal
	var _velh = sign(velh)
	//Equanto eu NÃO estiver colidindo na parede no próximo pixel
	//Então eu avanço 1 pixel
	while(!place_meeting(x + _velh, y, _obj_colision))
	{
		//Avanço 1 pixel
		x += _velh;
	}
//	//Isso só roda quando o while deixar de quando
//	//Vou zerar a minha velh
	velh = 0;
}

x += round(velh);

//Colisão vertical
if (place_meeting(x, y + velv, _obj_colision))
{
	//pegando o sinal da velocidade vertical
	var _velv = sign(velv)
	//Enquanto eu NÃO estiver colisindo na parede no próximo pixel
	//Então eu avanço 1 pixel
	while(!place_meeting(x, y + _velv, _obj_colision))
	{
		//Avanço 1 pixel
		y += _velv;
	}
	//Isso só roda quando o while deixar
	//Vou zerar a minha velv
	velv = 0;
}

y    += round(velv);
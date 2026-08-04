// Inherit the parent event
event_inherited();
_obj_colision = [obj_colisor]


sprites = [
			//sprites parado
			[sprite_index]
			
		  ];



move_speed = 8;

//Setando que eu sou o player
global.player		=  id;
obj_camera.alvo = global.player;

visivel = true;
timer_invencivel = 0;
toma_dano = false;

vida_max = 10
vida = vida_max;


//experiencia do player
xp = 0;
lvl = 1;

//dinheiro
cash = 200;

proximo_lvl = 4;
lvl_stack = 0;

dano_bonus = 0;
//delay entre os tiros
atk_speed = 0;
timer_tiro = 70;

//resistencia da pizza
res_pizza = 2;


// possiveis upgrades
// dano_bonus = adicionar dano
// move_speed = adicionar velocidade
// atk_speed  = diminuir a espera entre ataques
// res_pizza = faz a pizza quicar mais
// vida_max = adiciona na vida

atira = function()
{
	 if (global.bloquear_ataque)
        return;

    if (atk_speed > 0) atk_speed--;

    if (atk_speed <= 0)
    {
        image_xscale = 1.3;
        image_yscale = 1.3;

        var _tiro = instance_create_layer(x, y - 24, layer, obj_pizza_prime);
        var dir = point_direction(x, y, mouse_x, mouse_y);

        atk_speed = timer_tiro;

        _tiro.velh = lengthdir_x(_tiro.vel, dir);
        _tiro.velv = lengthdir_y(_tiro.vel, dir);
    }
}


estado_parado = function()
{
	if (estado_txt != "parado")
	{		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		//Mudando a sprite
		sprites_index = 0;
		estado_txt = "parado";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
	atira();
			
	
	
}

estado = estado_parado;

//Ajustando a orientação do meu listener
audio_listener_orientation(0, 0, 1, 0, -1, 0);
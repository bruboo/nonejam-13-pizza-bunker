// Inherit the parent event
event_inherited();
_obj_colision = [obj_colisor]


sprites = [
			//parado
			[spr_player_idle_a,spr_player_idle_w,spr_player_idle_d,spr_player_idle_s],
			//correndo
			[spr_player_run_a,spr_player_run_w,spr_player_run_d,spr_player_run_s],
			//morre
			[spr_player_morte,spr_player_morte_idle]	
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

dano_bonus = 1;
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


//upgrades corporais
//essa aqui é a forma prime oficial 
intervalo_fogo = 5;
timer_fogo = intervalo_fogo;
rastro_de_fogo_ativo = false;
rastro_de_fogo = function()
{
	if (!rastro_de_fogo_ativo) return;

	timer_fogo++;

	if (timer_fogo >= intervalo_fogo)
	{
		timer_fogo = 0;
		var _rastro = instance_create_layer(x,y-6,"Instances",obj_rastro_de_fogo);
		_rastro.image_xscale = 2;
		_rastro.image_yscale = 2;
	
			if (velh != 0)_rastro.image_angle = velh > 0 ? 0 : 180;
			else if (velv != 0)_rastro.image_angle = velv > 0 ? 270 : 90;
	
	}
}

intervalo_queijo = 6;
timer_queijo = intervalo_queijo;
rastro_de_queijo_ativo = false;
rastro_de_queijo = function()
{
	if (!rastro_de_queijo_ativo) return;

	timer_queijo++;

	if (timer_queijo >= intervalo_queijo)
	{
		timer_queijo = 0;
		var _rastro = instance_create_layer(x,y-6,"Instances",obj_rastro_de_queijo);
		//escolhe um dos frames
		_rastro.image_index = irandom(sprite_get_number(_rastro.sprite_index) - 1);
		_rastro.image_xscale = 2;
		_rastro.image_yscale = 2;
	
			if (velh != 0)_rastro.image_angle = velh > 0 ? 0 : 180;
			else if (velv != 0)_rastro.image_angle = velv > 0 ? 270 : 90;
	
	}
}


















toma_dano = function(_dano)
{
	if (estado == estado_morto) return false;
	if (timer_invencivel > 0) return false;

	vida = max(vida - _dano,0);
	timer_invencivel = 20;
	tomando_dano = true;

	if (vida <= 0)
	{
		estado = estado_morto;
	}

	return true;
};

controla_player = function()
{
	var _dir_x = global._key_right - global._key_left;
	var _dir_y = global._key_down - global._key_up;
	var _dist = point_distance(0, 0, _dir_x, _dir_y);

	if (_dist > 0) {
		_dir_x /= _dist;
		_dir_y /= _dist;
	}

	velh = _dir_x * move_speed;
	velv = _dir_y * move_speed;
}



atira = function()
{
	 if (global.bloquear_ataque)
        return;

    if (atk_speed > 0) atk_speed--;

    if (atk_speed <= 0)
    {
        //image_xscale = 1.3;
        //image_yscale = 1.3;

        var _tiro = instance_create_layer(x, y - 24, "Brilho", obj_pizza_prime);
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
	controla_player();
	var _dir = point_direction(x, y, mouse_x, mouse_y);

	if (_dir >= 45 && _dir < 135)
	    face = 1; // cima
	else if (_dir >= 135 && _dir < 225)
	    face = 0; // esquerda
	else if (_dir >= 225 && _dir < 315)
	    face = 3; // baixo
	else
    face = 2; // direita
	
	if (velh != 0 || velv != 0) estado = estado_andando;
	
	
	
	atira();

}
estado_andando = function()
{
	if (estado_txt != "andando")
	{		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		//Mudando a sprite
		sprites_index = 1;
		estado_txt = "andando";
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	controla_player();
	var _dir = point_direction(x, y, mouse_x, mouse_y);

	if (_dir >= 45 && _dir < 135)
	    face = 1; // cima
	else if (_dir >= 135 && _dir < 225)
	    face = 0; // esquerda
	else if (_dir >= 225 && _dir < 315)
	    face = 3; // baixo
	else
    face = 2; // direita
	
	if (velh == 0 && velv == 0) estado = estado_parado;
	
	atira();
	
	//upgrades
	rastro_de_fogo();
	rastro_de_queijo();
	
	if (current_time % 4 == 0)
	{
	    create_part(6,10,20,x,y-9,velh,velv);
	}
	
}

if(vida <= 0)
{
	estado = estado_morto;	
}

estado_morto = function()
{
	if (estado_txt != "morto")
	{		
		//aqui dentro as coisas acontecem apenas uma vez quando entra no estado
		//Mudando a sprite
		sprites_index = 2;
		estado_txt = "morto";
		face = 0;
		
		instance_create_layer(x,y,"Brilho",obj_reinicia_game);
	}
	//Animando a sprite
	ajusta_sprite(sprites_index);
	
	if (image_ind + image_spd >= image_numb)
	{
		//Mudando de estado
		face = 1;
	}
	
	

}
estado = estado_parado;

//Ajustando a orientação do meu listener
audio_listener_orientation(0, 0, 1, 0, -1, 0);
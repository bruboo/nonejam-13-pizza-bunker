

function create_part(_type = 0,_life_min = 0,_life_max,_x = 0, _y = 0,_velh = 0,_velv = 0)
{
	//vendo se o bgl existe mesmo
	if (!instance_exists(obj_part_control)) instance_create_depth(0,0,0,obj_part_control);
	
	switch(_type)
	{	
		//particulas fumaça em volta do forno
		case 0:
		{
		    var _qtd = irandom_range(3,5);

		    var _dir = point_direction(0, 0, _velh, _velv);

		    for (var i = 0; i < _qtd; i++)
		    {
		        var _ang = (360 / _qtd) * i;

		        var _part = instance_create_layer(_x, _y, "Brilho", obj_part_alpha);

		        var _part_spd = random_range(2,4);
		        var _size = random_range(0.5,1);
		        var _life = random_range(30,60);

		        _part.velh = lengthdir_x(_part_spd, _ang);
		        _part.velv = lengthdir_y(_part_spd, _ang);

		        _part.image_xscale = _size;
		        _part.image_yscale = _size;
		        _part._life_max = _life;
		        _part.life = _life;
		        _part.image_angle = random(360);
		        _part.sprite_index = spr_fumaca;
		    }
		}
		break;	
		case 1:
		{
				//quantidade de particulas
		var _qtd = irandom_range(1,1);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv)+180;
		
		//direção ao contrario
		//esse codigo com o +180 no final para fazer as particluas sairem ao contrario
		
		//var _dir = point_direction(0, 0, _velh, _velv)+180;
		
		
		// distancia depois do "impacto"
		var _espaco = -10;

		// Novo centro da explosão
		_x += lengthdir_x(_espaco, _dir);
		_y += lengthdir_y(_espaco, _dir);
				
			repeat(_qtd)
			{
				// abertura do Cone para cada lado
	            var _ang = _dir + random_range(-40, 40);
			
				// largura da base do cone
				var _base = 1; 
				var _posit_x = _x + lengthdir_x(random_range(-_base, _base), _dir + 90);
				var _posit_y = _y + lengthdir_y(random_range(-_base, _base), _dir + 90);
			
			
				//criando o bgl
				var _part = instance_create_layer(_posit_x, _posit_y, "Brilho", obj_part_star);
			
				// Velocidade aleatória para cada partícula
	            var _part_spd = 1;
				//tamanho do bgl
				var _size = random_range(1,2);
				//tempo de vida das particulas e tal
				var _life = random_range(_life_min,_life_max);

	            _part.velh = lengthdir_x(_part_spd, _ang);
	            _part.velv = lengthdir_y(_part_spd, _ang);
				_part.image_xscale = _size;
				_part.image_yscale = _size;
				//esse -90 tem algo a ver com o angulo do ponto de origem da sprite, como se fossem facas e o ponto fica na ponta da lamina 
				//(importante apenas se a sprite nao tem lados iguais) -90 cima, +90 baixo, esquerda +180, direita ja é o normal
				_part.image_angle = _ang-90;
				_part._life_max = _life;
				_part.life = _life;
				_part.sprite_index = choose( spr_part_1,spr_part_2,spr_part_3,spr_part_4,spr_part_5);
			
			}
				
		}
		break;
		case 2:
		{
			//quantidade de particulas
		var _qtd = irandom_range(1,5);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv);
		
		//direção ao contrario
		//esse codigo com o +180 no final para fazer as particluas sairem ao contrario
		
		//var _dir = point_direction(0, 0, _velh, _velv)+180;
		
		
		// distancia depois do "impacto"
		var _espaco = 60;

		// Novo centro da explosão
		_x += lengthdir_x(_espaco, _dir);
		_y += lengthdir_y(_espaco, _dir);
				
			repeat(_qtd)
			{
				// abertura do Cone para cada lado
	            var _ang = _dir + random_range(-40, 40);
			
				// largura da base do cone
				var _base = 20; 
				var _posit_x = _x + lengthdir_x(random_range(-_base, _base), _dir + 90);
				var _posit_y = _y + lengthdir_y(random_range(-_base, _base), _dir + 90);
			
			
				//criando o bgl
				var _part = instance_create_layer(_posit_x, _posit_y, "Instances", obj_part_star);
			
				// Velocidade aleatória para cada partícula
	            var _part_spd = random_range(5,20);
				//tamanho do bgl
				var _size = random_range(0.5,1);
				//tempo de vida das particulas e tal
				var _life = random_range(_life_min,_life_max);

	            _part.velh = lengthdir_x(_part_spd, _ang);
	            _part.velv = lengthdir_y(_part_spd, _ang);
				_part.image_xscale = _size;
				_part.image_yscale = _size;
				//esse -90 tem algo a ver com o angulo do ponto de origem da sprite, como se fossem facas e o ponto fica na ponta da lamina 
				//(importante apenas se a sprite nao tem lados iguais) -90 cima, +90 baixo, esquerda +180, direita ja é o normal
				_part.image_angle = _ang-90;
				_part._life_max = _life;
				_part.life = _life;
				_part.sprite_index = spr_part_1;
			
			}
		}			
		break;
		
		case 3:
		{
				//quantidade de particulas
		var _qtd = irandom_range(10,60);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv);
		
		//direção ao contrario
		//esse codigo com o +180 no final para fazer as particluas sairem ao contrario
		
		//var _dir = point_direction(0, 0, _velh, _velv)+180;
		
		
		// distancia depois do "impacto"
		var _espaco = 60;

		// Novo centro da explosão
		_x += lengthdir_x(_espaco, _dir);
		_y += lengthdir_y(_espaco, _dir);
				
			repeat(_qtd)
			{
				// abertura do Cone para cada lado
	            var _ang = random_range(0, 360);
			
			
			
			
				//criando o bgl
				var _part = instance_create_layer(_x, _y, "Brilho", obj_part_star);
			
				// Velocidade aleatória para cada partícula
	            var _part_spd = random_range(1,6);
				//tamanho do bgl
				var _size = random_range(0.2,1);
				//tempo de vida das particulas e tal
				var _life = random_range(_life_min,_life_max);

	            _part.velh = lengthdir_x(_part_spd, _ang);
	            _part.velv = lengthdir_y(_part_spd, _ang);
				_part.image_xscale = _size;
				_part.image_yscale = _size;
				//esse -90 tem algo a ver com o angulo do ponto de origem da sprite, como se fossem facas e o ponto fica na ponta da lamina 
				//(importante apenas se a sprite nao tem lados iguais) -90 cima, +90 baixo, esquerda +180, direita ja é o normal
				//_part.image_angle = _ang-90;
				_part._life_max = _life;
				_part.life = _life;
				_part.sprite_index = spr_part_star;
			
			}

			
		}
		break;
		
		case 4:
		{
				//quantidade de particulas
		var _qtd = irandom_range(20,80);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv);
		
		//direção ao contrario
		//esse codigo com o +180 no final para fazer as particluas sairem ao contrario
		
		//var _dir = point_direction(0, 0, _velh, _velv)+180;
		
		
		// distancia depois do "impacto"
		var _espaco = 60;

		// Novo centro da explosão
		_x += lengthdir_x(_espaco, _dir);
		_y += lengthdir_y(_espaco, _dir);
				
			repeat(_qtd)
			{
				// abertura do Cone para cada lado
	            var _ang = random_range(0, 360);
			
			
			
			
				//criando o bgl
				var _part = instance_create_layer(_x, _y, "Brilho", obj_part_star);
			
				// Velocidade aleatória para cada partícula
	            var _part_spd = random_range(1,10);
				//tamanho do bgl
				var _size = random_range(0.2,1);
				//tempo de vida das particulas e tal
				var _life = random_range(_life_min,_life_max);

	            _part.velh = lengthdir_x(_part_spd, _ang);
	            _part.velv = lengthdir_y(_part_spd, _ang);
				_part.image_xscale = _size;
				_part.image_yscale = _size;
				//esse -90 tem algo a ver com o angulo do ponto de origem da sprite, como se fossem facas e o ponto fica na ponta da lamina 
				//(importante apenas se a sprite nao tem lados iguais) -90 cima, +90 baixo, esquerda +180, direita ja é o normal
				_part.image_angle = _ang -90;
				_part._life_max = _life;
				_part.life = _life;
				_part.sprite_index = spr_part_1;
			
			}

			
		}
		break;
		
		
		//pizza explodindo
		case 5:
		{
			//quantidade de particulas
		var _qtd = irandom_range(5,10);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv);
		
		//direção ao contrario
		//esse codigo com o +180 no final para fazer as particluas sairem ao contrario
		
		//var _dir = point_direction(0, 0, _velh, _velv)+180;
	
			for (var i = 0; i < _qtd; i++)
			{
			    var _ang = (360 / _qtd) * i;

			    var _part = instance_create_layer(_x, _y, "Brilho", obj_part_star);

			    var _part_spd = random_range(3, 8);
			    var _size = random_range(0.2, 2);
			    var _life = random_range(_life_min, _life_max);

			    _part.velh = lengthdir_x(_part_spd, _ang);
			    _part.velv = lengthdir_y(_part_spd, _ang);

			    _part.image_xscale = _size;
			    _part.image_yscale = _size;
			    _part._life_max = _life;
			    _part.life = _life;
			    _part.sprite_index = spr_pizza_pedacos;
				_part.image_index = irandom(sprite_get_number(spr_pizza_pedacos) - 1);
			}
		}			
		break;
		//fumaça player
		case 6:
		{
		    var _qtd = irandom_range(5, 10);
		    var _dir = point_direction(0, 0, _velh, _velv);
		    var _dir_fumaca = _dir + 180;

		    for (var i = 0; i < _qtd; i++)
		    {
		        var _ang = _dir_fumaca + random_range(-10, 10);

		        var _part = instance_create_layer(_x, _y, "Brilho", obj_part_star_1);

		        var _part_spd = random_range(0.5, 2);
		        var _size = random_range(0.5, 1.2);
		        var _life = random_range(_life_min, _life_max);

		        _part.velh = lengthdir_x(_part_spd, _ang);
		        _part.velv = lengthdir_y(_part_spd, _ang);

		        

		        _part._life_max = _life;
		        _part.life = _life;
				_part.start_scale = _size;
				_part.image_xscale = _size;
				_part.image_yscale = _size;
		        _part.sprite_index = spr_fumaca_player;
		    }
		}
		break;
		//rastro de fogo
		case 7:
		{
			var _qtd = irandom_range(10, 20);

			for (var i = 0; i < _qtd; i++)
			{
				var _part = instance_create_layer(_x, _y, "Brilho", obj_part_fogo);

				var _spd = random_range(0.3, 2);
				var _size = random_range(0.3, 1);
				var _life = random_range(_life_min, _life_max);

				_part.velh = random_range(-0.2, 0.2);
				_part.velv = -_spd;

				_part._life_max = _life;
				_part.life = _life;
				_part.start_scale = _size;
				_part.image_xscale = _size;
				_part.image_yscale = _size;
				_part.sprite_index = spr_part_fogo;
			}
		}
		break;
		//particulas explosao forno
		case 8:
		{
			//quantidade de particulas
		var _qtd = irandom_range(10,30);
		
		// Direção do bgl
	    var _dir = point_direction(0, 0, _velh, _velv);
			
			for (var i = 0; i < _qtd; i++)
			{
			    var _ang = (360 / _qtd) * i;

			    var _part = instance_create_layer(_x, _y, "Brilho", obj_part_alpha);

			    var _part_spd = random_range(5, 5);
			    var _size = random_range(0.3, 2);
			    var _life = random_range(_life_min, _life_max);

			    _part.velh = lengthdir_x(_part_spd, _ang);
			    _part.velv = lengthdir_y(_part_spd, _ang);

			    _part.image_xscale = _size;
			    _part.image_yscale = _size;
			    _part._life_max = _life;
			    _part.life = _life;
				_part.image_angle = random(360);
			    _part.sprite_index = spr_fogo_forno;
				_part.image_index = irandom(sprite_get_number(spr_fogo_forno)- 1);
			}
		}			
		break;
		
		case 9:
		{
		    var _qtd = irandom_range(1,3);

		    var _dir = point_direction(0, 0, _velh, _velv);

		    for (var i = 0; i < _qtd; i++)
		    {
		        var _ang = (360 / _qtd) * i;

		        var _part = instance_create_layer(_x, _y, "Brilho", obj_part_alpha);

		        var _part_spd = random_range(2,4);
		        var _size = random_range(0.5,1);
		        var _life = random_range(30,60);

		        _part.velh = lengthdir_x(_part_spd, _ang);
		        _part.velv = lengthdir_y(_part_spd, _ang);

		        _part.image_xscale = _size;
		        _part.image_yscale = _size;
		        _part._life_max = _life;
		        _part.life = _life;
		        _part.image_angle = random(360);
		        _part.sprite_index = spr_fumaca;
		    }
		}
		break;	
	}
	
	
}
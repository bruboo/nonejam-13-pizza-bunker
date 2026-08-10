tempo_ms = 0;
timer_y = 30;

wave = 0;
timer_spawn = 0;




// referências dos objetos
inimigo_normal = obj_inimigo;
inimigo_1 = obj_inimigo_1;
inimigo_2 = obj_inimigo_2;
inimigo_3 = obj_inimigo_3;
inimigo_0 = obj_inimigo_0;
inimigo_5 = obj_inimigo_5;
inimigo_4 = obj_inimigo_4;
inimigo_6 = obj_inimigo_6

// waves
waves_jogo = [
	{
		tempo: 0,
		inimigos: [
			{obj: inimigo_0, chance: 80},
			{obj: inimigo_normal, chance: 20},
			{obj: inimigo_1, chance: 0},
			{obj: inimigo_2, chance: 0}
		],
		limite: 20,
		intervalo: 1
	},

	{
		// é 60 na vdd
		tempo: 40,
		inimigos: [
			{obj: inimigo_0, chance: 60},
			{obj: inimigo_normal, chance: 30},
			{obj: inimigo_1, chance: 10},
			{obj: inimigo_2, chance: 0}
		],
		limite: 20,
		intervalo: 1
	},
	{
		tempo: 80,
		inimigos: [
			{obj: inimigo_0, chance: 40},
			{obj: inimigo_normal, chance: 30},
			{obj: inimigo_1, chance: 30},
			{obj: inimigo_2, chance: 30}
		],
		limite: 25,
		intervalo: 1
	},
	{
		// é 60 na vdd
		tempo: 120,
		inimigos: [
			{obj: inimigo_0, chance: 10},
			{obj: inimigo_normal, chance: 45},
			{obj: inimigo_1, chance: 45},
			{obj: inimigo_2, chance: 0}
		],
		limite: 25,
		intervalo: 1
	},
	{
		tempo: 180,
		inimigos: [
			{obj: inimigo_0, chance: 0},
			{obj: inimigo_normal, chance: 30},
			{obj: inimigo_1, chance: 60},
			{obj: inimigo_2, chance: 10}
		],
		limite: 30,
		intervalo: 0.5
	},
	
	{
		tempo: 240,
		inimigos: [
			{obj: inimigo_0, chance: 20},
			{obj: inimigo_normal, chance: 30},
			{obj: inimigo_1, chance: 40},
			{obj: inimigo_2, chance: 10}
		],
		limite: 50,
		intervalo: 0.3
	},
	{
		tempo: 360,
		inimigos: [
			{obj: inimigo_0, chance: 0},
			{obj: inimigo_5, chance: 10},
			{obj: inimigo_1, chance: 60},
			{obj: inimigo_2, chance: 30}
		],
		limite: 40,
		intervalo: 0.3
	},
	{
		tempo: 480,
		inimigos: [
			{obj: inimigo_0, chance: 0},
			{obj: inimigo_5, chance: 20},
			{obj: inimigo_1, chance: 50},
			{obj: inimigo_2, chance: 30}
		],
		limite: 40,
		intervalo: 0.2
	},
	{
		tempo: 600,
		inimigos: [
			{obj: inimigo_0, chance: 0},
			{obj: inimigo_6, chance: 20},
			{obj: inimigo_1, chance: 50},
			{obj: inimigo_2, chance: 30}
		],
		limite: 50,
		intervalo: 0.1
	},
	{
		tempo: 780,
		inimigos: [
			{obj: inimigo_normal, chance: 0},
			{obj: inimigo_6, chance: 50},
			{obj: inimigo_3, chance: 20},
			{obj: inimigo_4, chance: 30}
		],
		limite: 40,
		intervalo: 0.1
	},
	{
		tempo: 900,
		inimigos: [
			{obj: inimigo_normal, chance: 1},
			{obj: inimigo_5, chance: 97},
			{obj: inimigo_1, chance: 1},
			{obj: inimigo_2, chance: 1}
		],
		limite: 40,
		intervalo: 0.2
	}
	
];


// waves tutorial
waves_tutorial = [
	{
		tempo: 5,
		inimigos: [
			{obj: inimigo_0, chance: 100}
		],
		limite: 2,
		intervalo: 1
	},
	{
		// é 60 na vdd
		tempo: 30,
		inimigos: [
			{obj: inimigo_0, chance: 100}			
		],
		limite: 4,
		intervalo: 1
	},
	{
		// é 60 na vdd
		tempo: 50,
		inimigos: [
			{obj: inimigo_0, chance: 100}			
		],
		limite: 6,
		intervalo: 0.5
	}
	
];




escolhe_inimigo = function(_lista)
{
	var _total = 0;

	for(var i = 0; i < array_length(_lista); i++)
	{
		_total += _lista[i].chance;
	}

	var _valor = random(_total);
	var _soma = 0;

	for(var i = 0; i < array_length(_lista); i++)
	{
		_soma += _lista[i].chance;

		if(_valor <= _soma)
		{
			return _lista[i].obj;
		}
	}

	return _lista[0].obj;
}


draw_numero_alinhado = function(_sprite, _valor, _x, _y, _espaco, _cor, _align)
{
    var _texto = string(_valor);
    var _largura = string_length(_texto) * _espaco;

    var _inicio_x = _x;

    if (_align == "center")
        _inicio_x = _x - _largura * 0.5;
    else if (_align == "right")
        _inicio_x = _x - _largura;

    for (var i = 1; i <= string_length(_texto); i++)
    {
        var _char = string_char_at(_texto, i);
        var _frame;

        if (_char == ":")
            _frame = 10;
        else
            _frame = real(_char);

        draw_sprite_ext(_sprite, _frame, _inicio_x + (i - 1) * _espaco, _y, 1, 1, 0, _cor, 1);
    }
}

// criar inimigo
spawn_inimigo = function(_obj)
{
	if (instance_number(obj_entidade_inimigo) >= 150)
		return;

	var _cam = global.game_settings.view_cam;

	var _cam_x = camera_get_view_x(_cam);
	var _cam_y = camera_get_view_y(_cam);
	var _cam_w = camera_get_view_width(_cam);
	var _cam_h = camera_get_view_height(_cam);

	var _margem_mapa = 224;
	var _margem_camera = 200;

	var _x_spawn;
	var _y_spawn;

	repeat(30)
	{
		if (room == rm_tutorial)
		{
			_x_spawn = random_range(0, 1000);
			_y_spawn = random_range(0, 570);
		}
		else
		{
			_x_spawn = random_range(_margem_mapa, 2845 - _margem_mapa);
			_y_spawn = random_range(_margem_mapa, 2200 - _margem_mapa);

			// Não pode nascer dentro da câmera
			if (point_in_rectangle(_x_spawn, _y_spawn, _cam_x - _margem_camera, _cam_y - _margem_camera, _cam_x + _cam_w + _margem_camera, _cam_y + _cam_h + _margem_camera))
				continue;
		}

		// Não pode nascer perto do player
		if (instance_exists(obj_player))
		{
			if (point_distance(_x_spawn, _y_spawn, obj_player.x, obj_player.y) < 80)
				continue;
		}

		// Não pode nascer dentro de parede
		if (place_meeting(_x_spawn, _y_spawn, obj_colisor))
			continue;

		instance_create_layer(_x_spawn, _y_spawn, "Instances", _obj);
		return;
	}
};



//upgrades da loja aqui
upgrades = [

/////////
		{
			frame:0,
			preco:50,
			ativa: function()
			{
				array_push(global.pimenta,
				{
				    frame: 0,
				    ocupado: false
				});	
			}
		},
/////////
		{
			frame:1,
			preco:1000,
			comprado: false,
			ativa: function()
			{
			     global.forno_sniper_ativo = true;
			}
		},
/////////
		{
			frame:2,
			preco:50,
			ativa: function()
			{
				array_push(global.fornos,
				{
				    frame: 0,
				    ocupado: false
				});
			}
		},
/////////
		{
			frame:3,
			preco:800,
			comprado: false,
			ativa: function()
			{
				
				global.forno_xplode_ativo = true;		
			}
		},
		/////////
		{
			frame:4,
			preco:500,
			comprado: false,
			ativa: function()
			{
				global.pizza_extra_ativa = true;
			}
		},
		/////////
		{
			frame:5,
			preco:50,
			ativa: function()
			{
				array_push(global.queijos,
				{
				    frame: 0,
				    ocupado: false
				});
			}
		}

]
//salva as 3 cartas
global.upgrades_loja = [];

gera_upgrades_loja = function()
{
    global.upgrades_loja = [];

    var disponiveis = [];

    // Pega apenas os upgrades que ainda podem aparecer
    for (var i = 0; i < array_length(upgrades); i++)
    {
        var _upgrade = upgrades[i];

        if (variable_struct_exists(_upgrade, "comprado") && _upgrade.comprado)
        {
            continue;
        }

        array_push(disponiveis, i);
    }

    var usados = [];

    // Sorteia até 3 upgrades
    var _quantidade = min(3, array_length(disponiveis));

    repeat(_quantidade)
    {
        var _indice;
        var _repetido;

        do
        {
            _indice = irandom(array_length(disponiveis) - 1);
            _repetido = array_contains(usados, _indice);

        } until(!_repetido);

        array_push(usados, _indice);

        var _indice_upgrade = disponiveis[_indice];

        array_push(global.upgrades_loja, upgrades[_indice_upgrade]);
    }
}
//aqui determina o tempo q vai ser chamado a porra
eventos_jogo = [
	{
		tempo: 60,
		acao: "loja",
		feito: false
	},
	{
		tempo: 120,
		acao: "loja",
		feito: false
	},
	{
		tempo: 180,
		acao: "pinto grande",
		feito: false
	},
	{
		tempo: 200,
		acao: "loja",
		feito: false
	},
	{
		tempo: 300,
		acao: "loja",
		feito: false
	},
	{
		tempo: 360,
		acao: "corvo grande",
		feito: false
	},
	{
		tempo: 400,
		acao: "loja",
		feito: false
	},
	{
		tempo: 600,
		acao: "loja",
		feito: false
	},
	{
		tempo: 610,
		acao: "bola oito grande",
		feito: false
	},
	{
		tempo: 700,
		acao: "loja",
		feito: false
	},
	{
		tempo: 800,
		acao: "boss",
		feito: false
	},
	{
		tempo: 900,
		acao: "fim",
		feito: false
	}
	
];

//aqui determina o tempo q vai ser chamado a porra
eventos_tutorial = [
	{
		tempo: 60,
		acao: "fim tutorial",
		feito: false
	}
	
];
if(room == rm_tutorial)
{
	waves = waves_tutorial;
	eventos = eventos_tutorial;
}
else
{
	waves = waves_jogo;
	eventos = eventos_jogo;
}

//saber se a porra da wave ta parada
wave_parada = false;

//para a porra da wave
parar_wave = function()
{
	wave_parada = true;

	with(obj_entidade_inimigo)
	{
		instance_destroy();
	}
};

//volta a wave
voltar_wave = function()
{
	wave_parada = false;
}

global.player_upgrades = [

///////// dano
		{
			frame:0,
			descricao:0,
			nivel:0,
			maximo:5000,
			ativa: function()
			{
				obj_player.dano_bonus += 1;
			}
		},
/////////
		{
			frame:1,
			descricao:1,
			nivel:0,
			maximo:5000,
			ativa: function()
			{
			        obj_player.vida_max += 2;
					obj_player.vida += 2;
			}
		},
/////////
		{
			frame:2,
			descricao:2,
			nivel:0,
			maximo:10,
			ativa: function()
			{
				obj_player.timer_tiro -= 3;
			}
		},
/////////
		{
			frame:3,
			descricao:3,
			nivel:0,
			maximo:500,
			ativa: function()
			{
				obj_player.move_speed += 1;
			}
		},
/////////
		{
			frame:4,
			descricao:4,
			nivel:0,
			maximo:5,
			ativa: function()
			{
				obj_player.res_pizza += 1;	
			}
		},
/////////		
		{
			frame:5,
			descricao:5,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				for (var i = 0; i < 3; i++)
				{
					var _pizza = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_pizza_orbita);

					_pizza.indice = i;
					_pizza.qtd_orbita = 3;
					_pizza.distancia = 120;
					_pizza.vel_giro = 3;
					_pizza.angulo = 0;
					_pizza.image_xscale = 2;
					_pizza.image_yscale = 2;
				}
			}
		},
		/////////		
		{
			frame:6,
			descricao:6,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				obj_player.rastro_de_queijo_ativo = true;	
			}
		},
		/////////		
		{
			frame:7,
			descricao:7,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				global.pizza_de_fogo_ativo = true;	
				
			}
		},
		/////////		
		{
			frame:8,
			descricao:8,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				obj_player.slow_area_ativo = true;
				var _area = instance_create_layer(obj_player.x,obj_player.y,"chao",obj_slow_area_player);
				_area.image_alpha = 0.3;
			}
		},
		/////////		
		{
			frame:9,
			descricao:9,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				global.pizza_slow_ativo = true;
			}
		},
		/////////		
		{
			frame:10,
			descricao:10,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				global.pizza_xplode_ativo = true;
			}
		},
		/////////		
		{
			frame:11,
			descricao:11,
			nivel:0,
			maximo:1,
			ativa: function()
			{
				global.pizza_pedaco_ativa = true;
			}
		},
		/////////		
		{
			frame:12,
			descricao:12,
			nivel:0,
			maximo:500,
			ativa: function()
			{
				obj_player.tempo_pizza += 10;
			}
		}

]
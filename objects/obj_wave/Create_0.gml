tempo_ms = 0;
timer_y = 30;

wave = 1;
timer_spawn = 0;

// referências dos objetos
inimigo_normal = obj_inimigo;
inimigo_1 = obj_inimigo_1;
inimigo_2 = obj_inimigo_2;

// waves
waves = [
	{
		tempo: 0,
		inimigos: [
			{obj: inimigo_normal, chance: 100}
		],
		limite: 30,
		intervalo: 1
	},

	{
		// é 60 na vdd
		tempo: 80,
		inimigos: [
			{obj: inimigo_normal, chance: 70},
			{obj: inimigo_1, chance: 30}
		],
		limite: 60,
		intervalo: 0.6
	},

	{
		tempo: 120,
		inimigos: [
			{obj: inimigo_normal, chance: 50},
			{obj: inimigo_1, chance: 35},
			{obj: inimigo_2, chance: 15}
		],
		limite: 100,
		intervalo: 0.3
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
	var _quantidade_spawn = instance_number(obj_spawn);

	if(_quantidade_spawn <= 0)
		return;


	var _spawn = instance_find(obj_spawn, irandom(_quantidade_spawn - 1));


	var _x_spawn = random_range(_spawn.x - _spawn.largura_area * 0.5, _spawn.x + _spawn.largura_area * 0.5);
	var _y_spawn = random_range(_spawn.y - _spawn.altura_area * 0.5, _spawn.y + _spawn.altura_area * 0.5);


	instance_create_layer(_x_spawn,_y_spawn,"Instances",_obj);
};

//upgrades da loja aqui
upgrades = [

/////////
		{
			frame:1,
			preco:67,
			ativa: function()
			{
				
			}
		},
/////////
		{
			frame:3,
			preco:56630,
			ativa: function()
			{
			       
			}
		},
/////////
		{
			frame:0,
			preco:100,
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
			frame:2,
			preco:150,
			ativa: function()
			{
				
			}
		}




]
//salva as 3 cartas
global.upgrades_loja = [];

gera_upgrades_loja = function()
{
	global.upgrades_loja = [];

	var usados = [];

	repeat(3)
	{
		var indice;
		var repetido;

		do
		{
			indice = irandom(array_length(upgrades) - 1);

			repetido = array_contains(usados, indice);

		} until(!repetido);

		array_push(usados, indice);
		array_push(global.upgrades_loja, upgrades[indice]);
	}
}
//aqui determina o tempo q vai ser chamado a porra
eventos = [
	{
		tempo: 30,
		acao: "loja",
		feito: false
	},
	{
		tempo: 60,
		acao: "loja",
		feito: false
	},
	{
		tempo: 90,
		acao: "loja",
		feito: false
	},
	{
		tempo: 120,
		acao: "loja",
		feito: false
	},

	{
		tempo: 600,
		acao: "boss",
		feito: false
	}
];

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
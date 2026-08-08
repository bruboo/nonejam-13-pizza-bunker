if (!global.parar && !instance_exists(obj_lvl_up) && !wave_parada)
{
    tempo_ms += delta_time / 1000000;
}

var _tempo = floor(tempo_ms);

for(var i = array_length(waves)-1; i >= 0; i--)
{
	if(_tempo >= waves[i].tempo)
	{
		wave = i + 1;
		break;
	}
}
if(wave > array_length(waves))
{
	wave = array_length(waves);
}

if(wave > 0)
{
	var _wave = waves[wave - 1];

	if(!wave_parada && !global.parar)
	{
		timer_spawn -= delta_time / 1000000;

		var _qtd_inimigos = instance_number(obj_entidade_inimigo);

		if(timer_spawn <= 0 && _qtd_inimigos < _wave.limite)
		{
			var _inimigo = escolhe_inimigo(_wave.inimigos);

			spawn_inimigo(_inimigo);

			timer_spawn = _wave.intervalo;
		}
	}
}

//eventos
for(var i = 0; i < array_length(eventos); i++)
{
	var _evento = eventos[i];

	if(!_evento.feito && tempo_ms >= _evento.tempo)
	{
		_evento.feito = true;

//aqui q fica o case dos eventos, 
		switch(_evento.acao)
		{
			case "loja":
				parar_wave();
				
				gera_upgrades_loja();
				with(obj_loja)
				{
					estado = "aberta";
				}
			break;
			
			case "fim tutorial":
				parar_wave();
				with(obj_comeca_jogo)
				{
					mandy_fim_ativa = true;
					mandy_fim_frame = 0;
					mandy_fim_x = display_get_gui_width();
					mandy_fim_entrando = true;
				}
				
			break;
			
			case "boss":
				//parar_wave();
				instance_create_layer(1410,2082,"Instances",obj_inimigo_boss);
			break;
		}
	}
}

alvo = global.player

estado = noone;
cam_id = noone;

view_border_w = global.game_settings.border_width;
view_border_h = global.game_settings.border_height;

draw_border = false;

centralize_width  = false;
centralize_height = false;

centralize_width_time  = 0;
centralize_height_time = 0;

//Funções
segue_alvo = function()
{
	//Pegando o tamanho da câmera
	_view_w = camera_get_view_width(global.game_settings.view_cam);
	_view_h = camera_get_view_height(global.game_settings.view_cam);
	//Pegando o tamanho da borda
	_border_w = -camera_get_view_x(global.game_settings.view_cam) + x;
	_border_h = -camera_get_view_y(global.game_settings.view_cam) + y;
	
	_cam_x =  x - _view_w*.5;
	_cam_y =  y - _view_h*.5;
	
	x = variable_instance_exists(alvo, "velh") ? round(lerp(x, alvo.x, .1)) + alvo.velh/2 : round(lerp(x, alvo.x, .1));
	y = variable_instance_exists(alvo, "velv") ? round(lerp(y, alvo.y, .1)) + alvo.velv/2 : round(lerp(y, alvo.y, .1));
	
	#region Centralizando o player
	//Setando a borda da camera
	camera_set_view_border(global.game_settings.view_cam, view_border_w, view_border_h);
	
	#region platforma
	/*
	//caso o player não mexer na vertical e o tempo para centralizar não tiver começado
	var cima_cam = camera_get_view_y(view_camera[0]) + global.game_settings.game_height/2
	
	if(alvo.velv == 0 and alvo.y < cima_cam and centralize_height_time == 0 and !centralize_height)centralize_height_time = 91;
	if(alvo.velv != 0 and centralize_height_time)centralize_height_time = 0;
	
	centralize_height_time = approach(centralize_height_time, 0, 1);
	if(centralize_height_time == 1)centralize_height = true;
	*/
	#endregion
	
	//Funções que centralizão a tela no objeto alvo
	centralizing_width();
	centralizing_height();
	#endregion
	
	#region limites da câmera
	_room = instance_position(alvo.x, alvo.y, obj_lit_visao);
	
	if (_room)
	{
		if(cam_id != _room.id)
		{
			cam_x_min = x
			cam_x_max = x
			cam_y_min = y
			cam_y_max = y
			cam_id = _room.id
		}
		cam_x_min = round(lerp(cam_x_min, _room.x + _border_w, .5));
		cam_x_max = round(lerp(cam_x_max, _room.x + (_view_w * _room.image_xscale) - _view_w + _border_w, .5));
		cam_y_min = round(lerp(cam_y_min, _room.y + _border_h, .5));
		cam_y_max = round(lerp(cam_y_max, _room.y + (_view_h * _room.image_yscale) - _view_h + _border_h, .5));
	}
	else
	{
		cam_id = noone;
		cam_x_min = _border_w;
		cam_x_max = room_width + _view_w + _border_h;
		cam_y_min = _border_h;
		cam_y_max = room_height + _view_h + _border_h;
	}

	x = clamp(x, cam_x_min, cam_x_max);
	y = clamp(y, cam_y_min, cam_y_max);
	#endregion


}

//Seguindo o player
segue_player = function()
{
	//Checando se o alvo existe
	if (instance_exists(alvo))
	{
		//Se sim, segue o alvo
		segue_alvo();
	}
}

centralizing_width = function()
{
	//Caso eu tenha que centralizar a horizontal
	if(centralize_width)
	{
		view_border_w = lerp(view_border_w, global.game_settings.game_width*.7, .1);
		
		var _dif_border_w = global.game_settings.game_width*.7  - view_border_w;
		
		if(abs(_dif_border_w) <= 15)
		{
			centralize_width = !centralize_width;
		}
	} else
	{
		view_border_w = global.game_settings.border_width;
	}
}

centralizing_height = function()
{
	//Caso eu tenha que centralizar a vertical
	if(centralize_height)
	{
		view_border_h = lerp(view_border_h, global.game_settings.game_height*.7, .05);
		
		var _dif_border_h = global.game_settings.game_height*.7 - view_border_h;
		
		//y = alvo.y - sprite_get_height(alvo.sprite_index)/4;
		
		if(abs(_dif_border_h) <= 5)
		{
			centralize_height = !centralize_height
		}
	}
	else
	{
		view_border_h = global.game_settings.border_height;
	}
}

estado = segue_player;

#region DEBUG
//Variaveis
debug_view = noone;
debug_section = [];

//Método de debug do jogo
roda_debug = function()
{
	if(!DEBUG_MODE)return;
	
	//Se não ta em debug, ele só sai do método
	if(!is_debug_overlay_open())
	{
		if(!dbg_view_exists(debug_view))return;
		
		//Destruindo as sessões
		for(var i = 0; i < array_length(debug_section); i++)
		{
			//Caso exista uma sessão eu deleto ela
			if(dbg_section_exists(debug_section[i]))dbg_section_delete(debug_section[i])
			//Retiro o valor da array
			array_delete(debug_section, i , 1);
		}
		
		//Destruindo a view
		dbg_view_delete(debug_view);
	}else
	{
		
		//Pegando o nome do alvo
		_alvo_name = alvo != noone ? string_replace_all(string_delete(object_get_name(alvo.object_index), 0, 4), "_", " ") : "Nenhum";
		
		if(!dbg_view_exists(debug_view))
		{
			//Criando meus bagui de debug dentro do view
			debug_view = dbg_view("Camera Settings", 1, 40, 40, 300, 400);
			
			//Criando a sessão primaria
			array_push(debug_section, dbg_section("Informações", true));
			
			//Quem estou seguindo?
			dbg_watch(ref_create(id, "_alvo_name"), "Alvo:");

			//Qual o tamanho das minhas bordas?
			dbg_watch(ref_create(id, "view_border_w"), "Borda Horizontal:");
			dbg_watch(ref_create(id, "view_border_h"), "Borda Vertical:");
			
			dbg_button("Centralizando Horizontal", function()
			{
				centralize_width = true;
			});
			
			dbg_button("Centralizando Horizontal", function()
			{
				centralize_height = true;
			});
			
			dbg_checkbox(ref_create(id, "draw_border"), "Draw Border:");
			
			////Criando a sessão dos loops
			//array_push(debug_section, dbg_section("LOOPs", false));
			
			//dbg_watch(ref_create(id, "_loop", 0), "LOOP Start");
			//dbg_watch(ref_create(id, "_loop", 1), "LOOP End");
			
			////Fazendo os sliders para mudar o começo e o final
			//dbg_slider(ref_create(id, "set_song_start"), 0, audio_sound_length(song_instance), "set song loop start", .1);
			//dbg_slider(ref_create(id, "set_song_end"), set_song_start, audio_sound_length(song_instance), "set song loop end", .1);
			
			//dbg_button("Application loop", function()
			//{
			//	audio_sound_loop_end(song_instance, set_song_end);
			//	audio_sound_loop_start(song_instance, set_song_start);
			//});
		};
	};
};
#endregion
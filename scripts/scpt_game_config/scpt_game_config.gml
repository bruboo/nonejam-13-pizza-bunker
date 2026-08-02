#macro Default:DEBUG_MODE 0
#macro modo_normal:DEBUG_MODE 0
#macro modo_debug:DEBUG_MODE 1	

global.game_settings = {};

with(global.game_settings)
{
	//varivaveis sobre a camera
	view = 0;
	view_cam         = noone;
	//Tamanho da camera do jogo
	game_width       = 1280;
	game_height      = 720;

	// Calcula a escala para manter o aspecto pixel perfect
	display_scale = min(display_get_width() div game_width, display_get_height() div game_height);
	//Tamanho da gui
	gui_width        = game_width  * display_scale;
	gui_height       = game_height * display_scale;
	//Tamanho da janela
	window_width     = game_width  * display_scale;
	window_height    = game_height * display_scale;
	
	border_width     = 450;
	border_height    = 450;
	
	//Qual vai ser o titulo da janela?
	window_caption   = "Template";
	//Começar em tela cheia?
	start_fullscreen = false;
	//O cursor vai ser visivel?
	cursor_visible   = false;
	//Qual sala eu devo ir depois da sala_init?
	room_start       = rm_menu;
}

function game_init()
{
	randomize();
	
	//Quem será o player?
	global.player = noone;
	
	//Fontes
	global.fnt_pixel_15   = font_add_sprite_ext(spr_fonte_15, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÀÁÂÃÇÉÊÍÒÓÔÕÚàáâãçéêíòóôõú!'()<>+,-_@./%;:=?0123456789", true, 1)
	global.fnt_pixel_30   = font_add_sprite_ext(spr_fonte_30, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÀÁÂÃÇÉÊÍÒÓÔÕÚàáâãçéêíòóôõú!'()<>+,-_@./%;:=?0123456789", true, 1)
	
	//particulas
	
	//Iniciando os grupos de audio
	audio_group_load(audiogroup_sound_effect);
	audio_group_load(audiogroup_music);
	audio_group_set_gain(audiogroup_sound_effect, .5, 0);
	audio_group_set_gain(audiogroup_music, .5, 0);
	
	//Instanciando os objetos do começo
	//SONS
	instance_create_depth(0, 0, 0, obj_music_manager);
	instance_create_depth(0, 0, 0, obj_ambient_manager);
	instance_create_depth(0, 0, 0, obj_sound_manager);
	
	//Controles
	instance_create_depth(0, 0, 0, obj_controler);
	instance_create_depth(0, 0, 0, obj_camera);
	
	
	room_goto(global.game_settings.room_start);
}

function game_set_window()
{
	//setando a visibilidade do cursor
	if(!global.game_settings.cursor_visible) window_set_cursor(cr_none);
	//setando no nome acima da janela
	window_set_caption(global.game_settings.window_caption);
	
	
	//setando o tamanho da janela
	window_set_size(global.game_settings.window_width, global.game_settings.window_height)
	//window_set_size(1440, 810)
	
	//setando o tamanho da surface
	surface_resize(application_surface, global.game_settings.game_width, global.game_settings.game_height);
	
	//setando o tamanho da GUI
	display_set_gui_size(global.game_settings.gui_width, global.game_settings.gui_height);
	
	//setando a janela no meio do monitor
	var _time_source_window_center = time_source_create(time_source_game, 1, time_source_units_frames, window_center);
	time_source_start(_time_source_window_center);
	
	//setando a possibilidade da tela cheia
	var _window_set_fullscreen = function()
	{
		window_set_fullscreen(global.game_settings.start_fullscreen);
	}
	var _time_source_window_fullscreen = time_source_create(time_source_game, 1, time_source_units_frames, _window_set_fullscreen);
	time_source_start(_time_source_window_fullscreen);
}

function game_enable_view_port()
{
	global.game_settings.view_cam = view_camera[global.game_settings.view];
	view_enabled = true;
	view_visible[global.game_settings.view] = true;
	camera_set_view_size(global.game_settings.view_cam, global.game_settings.game_width, global.game_settings.game_height);
	camera_set_view_target(global.game_settings.view_cam, obj_camera);
	camera_set_view_border(global.game_settings.view_cam, global.game_settings.border_width, global.game_settings.border_height);
}
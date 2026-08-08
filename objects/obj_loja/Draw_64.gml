if(estado == "aberta")
{
	var _player = global.player;

	if(instance_exists(_player))
	{
		var _dist = point_distance(_player.x,_player.y,x,y);

		if(_dist > 250)
		{
			var _dir = point_direction(_player.x,_player.y,x,y);

			var _gui_w = display_get_gui_width();
			var _gui_h = display_get_gui_height();

			var _cx = _gui_w * 0.5;
			var _cy = _gui_h * 0.5;

			var _raio = min(_gui_w,_gui_h) * 0.45;

			var _ix = _cx + lengthdir_x(_raio,_dir);
			var _iy = _cy + lengthdir_y(_raio,_dir);

			draw_sprite_ext(spr_loja_sinaliza,floor(sinaliza_frame),_ix,_iy,1,1,_dir-90,c_white,1);
		}
	}

	
	if(!botao_entrou)
{
	botao_x = approach(botao_x,botao_x_final,15);

	if(botao_x == botao_x_final)
	{
		botao_entrou = true;
	}
}
else
{
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	var _larg = sprite_get_width(spr_proxima_wave);
	var _alt = sprite_get_height(spr_proxima_wave);

	var _hover = point_in_rectangle(_mx,_my,botao_x + botao_offset - _larg * 0.5,450 - _alt * 0.5,botao_x + botao_offset + _larg * 0.5,450 + _alt * 0.5);

	var _alvo_offset = _hover ? -10 : 0;

	botao_offset = approach(botao_offset,_alvo_offset,1);
	
	if(_hover && mouse_check_button_pressed(mb_left))
	{
				
				estado = "fechada"
				obj_wave.voltar_wave();
				
	}
}

draw_sprite_ext(spr_proxima_wave,0,botao_x + botao_offset,450,1,1,0,c_white,1);




}
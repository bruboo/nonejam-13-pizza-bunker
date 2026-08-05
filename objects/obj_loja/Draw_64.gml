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
}
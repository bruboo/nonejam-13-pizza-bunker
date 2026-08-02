if(seq_id)
{
	layer_sequence_x(seq_id, camera_get_view_x(global.game_settings.view_cam) + global.game_settings.game_width/2);
	layer_sequence_y(seq_id, camera_get_view_y(global.game_settings.view_cam) + global.game_settings.game_height/2);
}
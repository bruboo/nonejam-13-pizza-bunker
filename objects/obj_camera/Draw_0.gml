if(draw_border)
{
	var _cam_x = camera_get_view_x(global.game_settings.view_cam) + camera_get_view_width(global.game_settings.view_cam)/2;
	var _cam_y = camera_get_view_y(global.game_settings.view_cam) + camera_get_view_height(global.game_settings.view_cam)/2;
	draw_rectangle(_cam_x - view_border_w, _cam_y - view_border_h, _cam_x  + view_border_w, _cam_y + view_border_h, true);
}

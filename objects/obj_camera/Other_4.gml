game_enable_view_port();

centralize_width  = true;

//Centralizando a câmera no player
if(instance_exists(global.player))
{
	x = global.player.x;
	y = global.player.y;
	global.player.local_x = global.player.x;
	global.player.local_y = global.player.y;
}
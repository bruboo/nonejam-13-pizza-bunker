var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _hover_reiniciar = point_in_rectangle(_mx,_my,295,379,295 + sprite_get_width(spr_reiniciar),379 + sprite_get_height(spr_reiniciar));
var _hover_sair = point_in_rectangle(_mx,_my,0,394,sprite_get_width(spr_sair),394 + sprite_get_height(spr_sair));

escala_reiniciar = lerp(escala_reiniciar,_hover_reiniciar ? 1.03 : 1,0.2);
escala_sair = lerp(escala_sair,_hover_sair ? 1.03 : 1,0.2);

if (_hover_reiniciar && mouse_check_button_pressed(mb_left))
{
	global.forno_xplode_ativo = false;
	global.forno_sniper_ativo = false;
	global.pizza_extra_ativa = false;
	global.pizza_de_fogo_ativo = false;
	global.pizza_slow_ativo = false;
	global.pizza_xplode_ativo = false;
	global.pizza_pedaco_ativa = false;
	room_restart();
}

if (_hover_sair && mouse_check_button_pressed(mb_left))
{
	game_end();
}
if(DEBUG_MODE)
{
	//ATIVANDO/DESATIVANDO O DEBUG
	if(keyboard_check_pressed(vk_tab))
	{
		global.debug = !global.debug;
		show_debug_overlay(global.debug);
	}
	
	//REINICIANDO O JOGO
	if(keyboard_check_pressed(ord("1")))game_restart();
}

#region Teclas
global._key_interate			= keyboard_check_pressed(keyboard_keys.action.key)	|| gamepad_button_check_pressed(global.gamepadID, gamepad_keys.action.key);
global._key_esc      				= keyboard_check_pressed(vk_escape)			|| gamepad_button_check_pressed(global.gamepadID, gp_start);
													
global._key_up						= keyboard_check(keyboard_keys.up.key)				|| keyboard_check(vk_up)			|| gamepad_axis_value(global.gamepadID, gp_axislv)  < -dead_zone || gamepad_button_check(global.gamepadID, gp_padu);
global._key_up_press			= (keyboard_check_pressed(keyboard_keys.up.key)	|| keyboard_check_pressed(vk_up)	|| gamepad_axis_value(global.gamepadID, gp_axislv)  < -dead_zone || gamepad_button_check_pressed(global.gamepadID, gp_padu)) and !pressed; 
																																								   			  
global._key_down				= keyboard_check(keyboard_keys.down.key)				|| keyboard_check(vk_down)			|| gamepad_axis_value(global.gamepadID, gp_axislv)  > dead_zone  || gamepad_button_check(global.gamepadID, gp_padd);  
global._key_down_press	= (keyboard_check_pressed(keyboard_keys.down.key)	|| keyboard_check_pressed(vk_down)	|| gamepad_axis_value(global.gamepadID, gp_axislv)  > dead_zone  || gamepad_button_check_pressed(global.gamepadID, gp_padd)) and !pressed; 
																																							   			  
global._key_left						= keyboard_check(keyboard_keys.left.key)				|| keyboard_check(vk_left)			|| gamepad_axis_value(global.gamepadID, gp_axislh)  < -dead_zone || gamepad_button_check(global.gamepadID, gp_padl); 
global._key_left_press			= (keyboard_check_pressed(keyboard_keys.left.key)	|| keyboard_check_pressed(vk_left)	|| gamepad_axis_value(global.gamepadID, gp_axislh)  < -dead_zone || gamepad_button_check_pressed(global.gamepadID, gp_padl)) and !pressed; 
																																							   			  
global._key_right					= keyboard_check(keyboard_keys.right.key)				|| keyboard_check(vk_right)		 	|| gamepad_axis_value(global.gamepadID, gp_axislh)  > dead_zone  || gamepad_button_check(global.gamepadID, gp_padr); 
global._key_right_press		= (keyboard_check_pressed(keyboard_keys.right.key)	|| keyboard_check_pressed(vk_right) || gamepad_axis_value(global.gamepadID, gp_axislh)  > dead_zone  || gamepad_button_check_pressed(global.gamepadID, gp_padr)) and !pressed;  

//Fazendo o pressed do analogico do controle
if(global._key_up_press or global._key_left_press or global._key_down_press or global._key_right)pressed = 1;
if(abs(gamepad_axis_value(global.gamepadID, gp_axislv))  <= dead_zone and abs(gamepad_axis_value(global.gamepadID, gp_axislh))  <= dead_zone)pressed = 0;

#endregion

#region parar_player
if (instance_exists(global.player))
{
	var obj_parar_player =  parar_forc 
	or instance_exists(obj_menu);
	
	if (obj_parar_player)
	{global.parar = true;} else 
	{global.parar = false;}
}


if(global._key_esc and !instance_exists(obj_menu))
{
	var _menu  = instance_create_depth(0, 0, -9999, obj_menu);
	_menu.Type = 1;
}
#endregion
//Variaveis globais
global.debug							= false;
parar_forc								= false;
global.parar							= false;




//Controles
global.gamepadID				= -50;
pressed									= 0;
dead_zone								= .25;

//o player nao ataca
global.bloquear_ataque = false;



//Array de eventos que vão ser resetados ao chegar perto do save
eventos_rapidos  = [];
//Array de eventos que serão salvos. para não se perder
eventos = [];

global._key_interate			= noone;
global._key_esc						= noone;
							
global._key_up						= noone;
global._key_up_press			= noone;
global._key_down				= noone;
global._key_down_press	= noone;
							
global._key_left						= noone;
global._key_left_press			= noone;
global._key_right					= noone;
global._key_right_press		= noone;

#region Mapa das teclas
draw_key = function(_key){

	var _txt = "";
	
	switch(_key)
	{
		case -1: _txt = "No Key" break;
		case 8: _txt = "Backspace" break;
		case 9: _txt = "Tab" break;
		case 13: _txt = "Enter" break;
		case 16: _txt = "Shift" break;
		case 17: _txt = "Ctrl" break;
		case 18: _txt = "Alt" break;
		case 19: _txt = "Pause/Break" break;
		case 20: _txt = "CAPS" break;
		case 27: _txt = "Esc" break;
		case 32: _txt = "Space" break;
		case 33: _txt = "Page Up" break;
		case 34: _txt = "Page Down" break;
		case 35: _txt = "End" break;
		case 36: _txt = "Home" break;
		case 37: _txt = "Left Arrow" break;
		case 38: _txt = "Up Arrow" break;
		case 39: _txt = "Right Arrow" break;
		case 40: _txt = "Down Arrow" break;
		case 45: _txt = "Insert" break;
		case 46: _txt = "Delete" break;
		case 96: _txt = "Numpad 0" break;
		case 97: _txt = "Numpad 1" break;
		case 98: _txt = "Numpad 2" break;
		case 99: _txt = "Numpad 3" break;
		case 100: _txt = "Numpad 4" break;
		case 101: _txt = "Numpad 5" break;
		case 102: _txt = "Numpad 6" break;
		case 103: _txt = "Numpad 7" break;
		case 104: _txt = "Numpad 8" break;
		case 105: _txt = "Numpad 9" break;
		case 106: _txt = "Numpad *" break;
		case 107: _txt = "Numpad +" break;
		case 109: _txt = "Numpad -" break;
		case 110: _txt = "Numpad ." break;
		case 111: _txt = "Numpad /" break;
		case 112: _txt = "F1" break;
		case 113: _txt = "F2" break;
		case 114: _txt = "F3" break;
		case 115: _txt = "F4" break;
		case 116: _txt = "F5" break;
		case 117: _txt = "F6" break;
		case 118: _txt = "F7" break;
		case 119: _txt = "F8" break;
		case 120: _txt = "F9" break;
		case 121: _txt = "F10" break;
		case 122: _txt = "F11" break;
		case 123: _txt = "F12" break;
		case 144: _txt = "Num Lock" break;
		case 145: _txt = "Scroll Lock" break;
		case 186: _txt = ";" break;
		case 187: _txt = "=" break;
		case 188: _txt = "," break;
		case 189: _txt = "-" break;
		case 190: _txt = "." break;
		case 191: _txt = "\ " break;
		case 192: _txt = "` " break;
		case 219: _txt = "/ " break;
		case 220: _txt = "[ " break;
		case 221: _txt = "] " break;
		case 222: _txt = "' " break;
		default :
			if (_key >= ord("A") && _key <= ord("Z")) _txt = chr(_key);
            if (_key >= ord("0") && _key <= ord("9")) _txt = chr(_key);
		
	}

	return _txt;
}

draw_key_gamepad = function(_key){

	var _txt = "";
	
	switch(_key)
	{
		case -1: _txt = "No Key" break;
		case gp_face1: _txt = "A" break;
		case gp_face2: _txt = "B" break;
		case gp_face3: _txt = "X" break;
		case gp_face4: _txt = "Y" break;
		case gp_shoulderl: _txt = "LT" break;
		case gp_shoulderlb: _txt = "LB" break;
		case gp_shoulderr: _txt = "RT" break;
		case gp_shoulderrb: _txt = "RB" break;
		case gp_select: _txt = "Select" break;
		case gp_start: _txt = "Start" break;
		case gp_stickl: _txt = "Left Stick" break;
		case gp_stickr: _txt = "Right Stick" break;
		case gp_padu: _txt = "D-pad Up" break;
		case gp_padd: _txt = "D-pad Down" break;
		case gp_padl: _txt = "D-pad Left" break;
		case gp_padr: _txt = "D-pad Right" break;
		default :
			if (gamepad_axis_value(global.gamepadID, gp_axislh) > +dead_zone) _txt = "Left  AxisL" 
			if (gamepad_axis_value(global.gamepadID, gp_axislh) < -dead_zone) _txt = "Right AxisL" 
			if (gamepad_axis_value(global.gamepadID, gp_axislv) > +dead_zone) _txt = "Up AxisL" 
			if (gamepad_axis_value(global.gamepadID, gp_axislv) < -dead_zone) _txt = "Down AxisL" 
			
			if (gamepad_axis_value(global.gamepadID, gp_axisrh) > +dead_zone) _txt = "Left  AxisR" 
			if (gamepad_axis_value(global.gamepadID, gp_axisrh) < -dead_zone) _txt = "Right AxisR" 
			if (gamepad_axis_value(global.gamepadID, gp_axisrv) > +dead_zone) _txt = "Up AxisR" 
			if (gamepad_axis_value(global.gamepadID, gp_axisrv) < -dead_zone) _txt = "Down AxisR" 
	}

	return _txt;
}

keyboard_keys = {
	up					: {txt : draw_key(ord("W")),									key : ord("W")},
	left					: {txt : draw_key(ord("A")),										key : ord("A")},
	down			: {txt : draw_key(ord("S")),										key : ord("S")},
	right				: {txt : draw_key(ord("D")),										key : ord("D")},
							
	action			: {txt : draw_key(vk_space),									key : vk_space},
	concert			: {txt : draw_key(ord("G")),										key : ord("G")},
	
	gun_red		: {txt : draw_key(ord("H")),									key : ord("H")},
	gun_pink		: {txt : draw_key(ord("J")),										key : ord("J")},
	gun_blue		: {txt : draw_key(ord("K")),										key : ord("K")},
	gun_yellow	: {txt : draw_key(ord("L")),										key : ord("L")}
}

gamepad_keys = {
	up					: {txt : draw_key_gamepad(gp_axislv),				key : gp_axislv},
	left					: {txt : draw_key_gamepad(gp_axislh),				key : gp_axislh},
	down			: {txt : draw_key_gamepad(gp_axislv),				key : gp_axislv},
	right				: {txt : draw_key_gamepad(gp_axislh),				key : gp_axislh},
																												
	action			: {txt : draw_key_gamepad(gp_face1),				key : gp_face1},
	concert			: {txt : draw_key_gamepad(gp_face2),				key : gp_face2},
	
	gun_red		: {txt : draw_key_gamepad(gp_shoulderl),		key : gp_shoulderl},
	gun_pink		: {txt : draw_key_gamepad(gp_shoulderlb),	key : gp_shoulderlb},
	gun_blue		: {txt : draw_key_gamepad(gp_shoulderrb),	key : gp_shoulderrb},
	gun_yellow	: {txt : draw_key_gamepad(gp_shoulderr),		key : gp_shoulderr} 
}
#endregion

//Função que checa se algum botão do controle foi acionado
gamepad_check_any_button = function()
{
	//Checando se tem um controle conectado
	if(global.gamepadID != -50)
	{
		//Verificando os botões(Exeto o analogico, visto que não é botão)
		for(var _i = gp_face1; _i < gp_padr; _i++)
		{
			if(gamepad_button_check(global.gamepadID, _i))
			{
				return true
			}
		}
		//Verificando os analogicos
		if(abs(gamepad_axis_value(global.gamepadID, gp_axislv))  > dead_zone or abs(gamepad_axis_value(global.gamepadID, gp_axislh))  > dead_zone)return true;
	}
	
	return false;
}


global.fornos = [];

//salva o dinheiro q tinha antes
cash_antigo = 0;
cash_scale = 1;
cash_numero_scale = 1;
hud_y_offset = 0;
hud_cash_x_offset = 0;

//transformando numeral em sprites
draw_numero_sprite = function(_sprite, _valor, _x, _y, _espaco, _escala)
{
    var _texto = string(clamp(_valor, 0, 9999));

    while (string_length(_texto) < 4)
    {
        _texto = "0" + _texto;
    }

    var _offset = [0, -3, -5, -7];

    for (var i = 1; i <= 4; i++)
    {
        var _numero = real(string_char_at(_texto, i));

        var _xx = _x + (i - 1) * _espaco * _escala;
        var _yy = _y + _offset[i - 1];

        draw_sprite_ext(_sprite, _numero, _xx, _yy, _escala, _escala, 0, c_white, 1);
    }
}

//numero alinhado
draw_numero_alinhado = function(_sprite, _valor, _x, _y, _espaco, _cor, _align)
{
    var _texto = string(_valor);
    var _largura = string_length(_texto) * _espaco;

    var _inicio_x = _x;

    if (_align == "center")
    {
        _inicio_x = _x - _largura * 0.5;
    }
    else if (_align == "right")
    {
        _inicio_x = _x - _largura;
    }

    for (var i = 1; i <= string_length(_texto); i++)
    {
        var _numero = real(string_char_at(_texto, i));

        draw_sprite_ext(_sprite, _numero, _inicio_x + (i - 1) * _espaco, _y, 1, 1, 0, _cor, 1);
    }
}




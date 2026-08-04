var espaco = -100;

var _largura = sprite_get_width(spr_forno_spot_alerta);
var _altura = sprite_get_height(spr_forno_spot_alerta);
var _quantidade = array_length(global.fornos);

if (!variable_global_exists("fornos_offset"))
{
    global.fornos_offset = array_create(_quantidade, 0);
}

if (array_length(global.fornos_offset) != _quantidade)
{
    global.fornos_offset = array_create(_quantidade, 0);
}

var _total = _largura + (_quantidade - 1) * (_largura + espaco);

var _inicio_x = (display_get_gui_width() - _total) * 0.5 + _largura * 0.5;
var _y = display_get_gui_height() + 13;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _tem_ocupado = false;

for (var j = 0; j < array_length(global.fornos); j++)
{
    if (global.fornos[j].ocupado)
    {
        _tem_ocupado = true;
        break;
    }
}

for (var i = 0; i < _quantidade; i++)
{
    var _x = _inicio_x + i * (_largura + espaco);

    var _frame = floor(global.fornos[i].frame);

    var _mouse_cima = point_in_rectangle(_mx, _my, _x - _largura * 0.5, _y - _altura, _x + _largura * 0.5, _y);

if (global.fornos[i].ocupado)
{
    _frame = 1;
    global.fornos_offset[i] = lerp(global.fornos_offset[i], -12, 0.2);
}
else
{
    var _destino = _mouse_cima ? -12 : 0;
    global.fornos_offset[i] = lerp(global.fornos_offset[i], _destino, 0.2);

    if (_mouse_cima)
    {
        _frame = 1;

        if (mouse_check_button_pressed(mb_left) && !_tem_ocupado)
        {
            var _spot = instance_create_layer(mouse_x, mouse_y, "Instances", obj_forno_spot);

            _spot.forno = global.fornos[i];
            global.fornos[i].ocupado = true;
			global.bloquear_ataque = true;
			
            break;
        }
    }
}

    draw_sprite(spr_forno_spot_alerta, _frame, _x, _y + global.fornos_offset[i]);
}

//hud


//barra de xp
draw_sprite_ext(spr_hud_xp,0,1024,hud_y_offset,1,1,0,c_white,1);

if (instance_exists(obj_player))
{
    var _porcentagem = clamp(obj_player.xp / obj_player.proximo_lvl, 0, 1);

    var _larg = sprite_get_width(spr_hud_xp_progresso);
    var _alt = sprite_get_height(spr_hud_xp_progresso);

    draw_sprite_part(spr_hud_xp_progresso, 0, 0, 0, _larg * _porcentagem, _alt, 310,hud_y_offset);
	draw_numero_alinhado(spr_numeral_cash, obj_player.lvl, 993, 11 + hud_y_offset, 14,c_white,"center");
}

//barra de vida
draw_sprite_ext(spr_hud_lifebar,0,0,hud_y_offset,1,1,0,c_white,1);
if (instance_exists(obj_player))
{
    var _porcentagem = clamp(obj_player.vida / obj_player.vida_max, 0, 1);

    var _larg = sprite_get_width(spr_hud_lifebar_vitals);
    var _alt = sprite_get_height(spr_hud_lifebar_vitals);

    draw_sprite_part(spr_hud_lifebar_vitals, 0, 0, 0, _larg * _porcentagem, _alt, 118, 3 + hud_y_offset);
	draw_numero_alinhado(spr_numeral_vida, obj_player.vida, 198, 4 + hud_y_offset, 14,c_white,"right");
	draw_numero_alinhado(spr_numeral_vida, obj_player.vida_max, 210, 3 + hud_y_offset, 14,c_white,"left");
	draw_sprite(spr_barra_textos,0,199,5);
}



//dinheiro


draw_sprite_ext(spr_hud_cash,0,hud_cash_x_offset,105,cash_scale,cash_scale,0,c_white,1);
if(instance_exists(obj_player)) draw_numero_sprite(spr_numeral_cash, obj_player.cash, 11 + hud_cash_x_offset, 206, 14, cash_numero_scale);






















































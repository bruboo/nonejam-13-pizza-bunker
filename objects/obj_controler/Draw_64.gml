







if (!surface_exists(gui_surface))
{
    gui_surface = surface_create(1024, 576);
}

surface_set_target(gui_surface);
draw_clear_alpha(c_black, 0);

// TODO: todo seu código atual de Draw GUI entra aqui

surface_reset_target();


if(room != rm_01)
{
    exit;
}

//======================================================
// CONFIGURAÇÃO GERAL
//======================================================

var _espaco = -100;

var _largura = sprite_get_width(spr_forno_spot_alerta);
var _qtd_fornos = array_length(global.fornos);
var _qtd_queijos = array_length(global.queijos);
var _qtd_pimentas = array_length(global.pimenta);

var _qtd_total = _qtd_fornos + _qtd_queijos + _qtd_pimentas;

var _total = _largura + (_qtd_total - 1) * (_largura + _espaco);

var _inicio_x = (display_get_gui_width() - _total) * 0.5 + _largura * 0.5;
var _y = display_get_gui_height() + 13;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _indice = 0;


//======================================================
// FORNOS
//======================================================

var _altura_forno = sprite_get_height(spr_forno_spot_alerta);

if (!variable_global_exists("fornos_offset"))
{
    global.fornos_offset = array_create(_qtd_fornos, 0);
}

if (array_length(global.fornos_offset) != _qtd_fornos)
{
    global.fornos_offset = array_create(_qtd_fornos, 0);
}

var _tem_ocupado = false;

for (var j = 0; j < _qtd_fornos; j++)
{
    if (global.fornos[j].ocupado)
    {
        _tem_ocupado = true;
        break;
    }
}

for (var i = 0; i < _qtd_fornos; i++)
{
    var _x = _inicio_x + _indice * (_largura + _espaco);
    var _frame = floor(global.fornos[i].frame);

    var _mouse_cima = point_in_rectangle(_mx, _my, _x - _largura * 0.5, _y - _altura_forno, _x + _largura * 0.5, _y);

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

           if (mouse_check_button_pressed(mb_left) && !_tem_ocupado && !global.bloquear_ataque)
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

    _indice++;
}


//======================================================
// QUEIJOS
//======================================================

var _largura_queijo = sprite_get_width(spr_queijo_spot_alerta);
var _altura_queijo = sprite_get_height(spr_queijo_spot_alerta);

if (!variable_global_exists("queijos_offset"))
{
    global.queijos_offset = array_create(_qtd_queijos, 0);
}

if (array_length(global.queijos_offset) != _qtd_queijos)
{
    global.queijos_offset = array_create(_qtd_queijos, 0);
}

var _tem_ocupado_q = false;

for (var j = 0; j < _qtd_queijos; j++)
{
    if (global.queijos[j].ocupado)
    {
        _tem_ocupado_q = true;
        break;
    }
}

for (var i = 0; i < _qtd_queijos; i++)
{
    var _x = _inicio_x + _indice * (_largura + _espaco);
    var _frame = floor(global.queijos[i].frame);

    var _mouse_cima = point_in_rectangle(_mx, _my, _x - _largura_queijo * 0.5, _y - _altura_queijo, _x + _largura_queijo * 0.5, _y);

    if (global.queijos[i].ocupado)
    {
        _frame = 1;
        global.queijos_offset[i] = lerp(global.queijos_offset[i], -12, 0.2);
    }
    else
    {
        var _destino = _mouse_cima ? -12 : 0;
        global.queijos_offset[i] = lerp(global.queijos_offset[i], _destino, 0.2);

        if (_mouse_cima)
        {
            _frame = 1;

            if (mouse_check_button_pressed(mb_left) && !_tem_ocupado_q && !global.bloquear_ataque)
            {
                var _spot = instance_create_layer(mouse_x, mouse_y, "Instances", obj_queijo_spot);

                _spot.queijo = global.queijos[i];
                global.queijos[i].ocupado = true;
                global.bloquear_ataque = true;

                break;
            }
        }
    }

    draw_sprite(spr_queijo_spot_alerta, _frame, _x, _y + global.queijos_offset[i]);

    _indice++;
}


//======================================================
// PIMENTAS
//======================================================

var _largura_pimenta = sprite_get_width(spr_queijo_spot_alerta_1);
var _altura_pimenta = sprite_get_height(spr_queijo_spot_alerta_1);

if (!variable_global_exists("pimenta_offset"))
{
    global.pimenta_offset = array_create(_qtd_pimentas, 0);
}

if (array_length(global.pimenta_offset) != _qtd_pimentas)
{
    global.pimenta_offset = array_create(_qtd_pimentas, 0);
}

var _tem_ocupado_p = false;

for (var j = 0; j < _qtd_pimentas; j++)
{
    if (global.pimenta[j].ocupado)
    {
        _tem_ocupado_p = true;
        break;
    }
}

for (var i = 0; i < _qtd_pimentas; i++)
{
    var _x = _inicio_x + _indice * (_largura + _espaco);
    var _frame = floor(global.pimenta[i].frame);

    var _mouse_cima = point_in_rectangle(_mx, _my, _x - _largura_pimenta * 0.5, _y - _altura_pimenta, _x + _largura_pimenta * 0.5, _y);

    if (global.pimenta[i].ocupado)
    {
        _frame = 1;
        global.pimenta_offset[i] = lerp(global.pimenta_offset[i], -12, 0.2);
    }
    else
    {
        var _destino = _mouse_cima ? -12 : 0;
        global.pimenta_offset[i] = lerp(global.pimenta_offset[i], _destino, 0.2);

        if (_mouse_cima)
        {
            _frame = 1;

            if (mouse_check_button_pressed(mb_left) && !_tem_ocupado_p && !global.bloquear_ataque)
            {
                var _spot = instance_create_layer(mouse_x, mouse_y, "Instances", obj_pimenta_spot);

                _spot.pimenta = global.pimenta[i];
                global.pimenta[i].ocupado = true;
                global.bloquear_ataque = true;

                break;
            }
        }
    }

    draw_sprite(spr_queijo_spot_alerta_1, _frame, _x, _y + global.pimenta_offset[i]);

    _indice++;
}


//hud


//barra de xp
draw_sprite_ext(spr_hud_xp,0,1024,hud_y_offset,1,1,0,c_white,1);

if (instance_exists(obj_player))
{
    var _porcentagem = xp_barra;

    var _larg = sprite_get_width(spr_hud_xp_progresso);
    var _alt = sprite_get_height(spr_hud_xp_progresso);

    draw_sprite_part(spr_hud_xp_progresso, 0, 0, 0, _larg * _porcentagem, _alt, 310,hud_y_offset);
	draw_numero_alinhado(spr_numeral_cash, obj_player.lvl, 993, 11 + hud_y_offset, 14,c_white,"center");
}

//barra de vida
draw_sprite_ext(spr_hud_lifebar,0,0,hud_y_offset,1,1,0,c_white,1);
if (instance_exists(obj_player))
{
    var _porcentagem = vida_barra;

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









//desenhando o mouse
draw_sprite_ext(spr_target,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,1);











































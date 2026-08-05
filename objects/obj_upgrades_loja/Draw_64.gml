//draw_set_color(c_black);
//draw_set_alpha(.4);
//draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), false);
//draw_set_alpha(1);
//draw_set_color(c_white);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var espaco = 40;
var escala = 1;

var _largura = sprite_get_width(spr_roleta_upgrades_loja) * escala;
var _altura = sprite_get_height(spr_roleta_upgrades_loja) * escala;

var _total = array_length(upgrade_escolha) * _largura + (array_length(upgrade_escolha) - 1) * espaco;

var _inicio_x = (display_get_gui_width() - _total) * 0.5;
var _y = 10;

entrada_y = lerp(entrada_y, 0, 0.3);

for (var i = 0; i < array_length(upgrade_escolha); i++)
{
    var carta = upgrade_escolha[i];	
	var _comprar = obj_player.cash >= carta.preco;

    var _x = _inicio_x + i * (_largura + espaco);
    var alvo = 0;

    if (point_in_rectangle(mx, my, _x, _y + entrada_y + saida_y, _x + _largura, _y + _altura + entrada_y + saida_y) && !saindo)
    {
        alvo = 10;

        if (delay_clike <= 0 && mouse_check_button_pressed(mb_left))
        {
			if (obj_player.cash >= carta.preco)
			{
				obj_player.cash -= carta.preco;
				click_scale[i] = 1.3;
				carta.ativa();
			}
        }
    }

    cima_x[i] = lerp(cima_x[i], alvo, 0.15);
    click_scale[i] = lerp(click_scale[i], 1, 0.25);

    var _escala = escala * click_scale[i];

    var _draw_x = _x + (_largura * (1 - click_scale[i])) * 0.5;
    var _draw_y = _y + cima_x[i] + entrada_y + saida_y + (_altura * (1 - click_scale[i])) * 0.5;

    draw_sprite_ext(spr_roleta_upgrades_loja, carta.frame, _draw_x, _draw_y, _escala, _escala, 0, c_white, 1);
    if(!_comprar)
	{
		draw_sprite_ext(spr_loja_sinaliza, 0, _draw_x, _draw_y, _escala, _escala, 0, c_white, 1);
	}
    draw_numero_alinhado(spr_numeral_cash_loja, carta.preco, _draw_x + (_largura * click_scale[i]) * 0.5, _draw_y + (_altura * click_scale[i]) + 10, 14, _comprar ? c_white : $191919, "center", 1);
    
}

draw_sprite_ext(spr_target, 0, mx, my, 1, 1, 0, c_white, 1);
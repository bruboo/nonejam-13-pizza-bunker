


draw_set_color(c_black);
draw_set_alpha(.4);
draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(-1);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var margem = 20;
var espaco = 130;


var largura = sprite_get_width(spr_escolha_botao);
var altura = sprite_get_height(spr_escolha_botao);

var _x = display_get_gui_width() - margem;
var pos_saida = saindo ? saida_x : 0;
entrada_x = lerp(entrada_x, 0, 0.3);

for (var i = 0; i < array_length(upgrade_escolha); i++)
{
    var carta = upgrade_escolha[i];
    var yy = 40 + i * (altura + espaco);
	var alvo = 0;
    if (point_in_rectangle(mx, my, _x - largura*2, yy, _x, yy + altura*2) && !saindo)
    {
        alvo = -60;
		if (mouse_check_button_pressed(mb_left))
	    {
	        carta_selecionada = i;
			saindo = true;
	    }
    }
	hover_x[i] = lerp(hover_x[i], alvo, 0.15);
    draw_sprite_ext(spr_escolha_botao, carta.frame, _x + hover_x[i] + entrada_x + pos_saida, yy, 2, 2, 0, c_white, 1);
	//draw_rectangle( _x- largura*2, yy, _x , yy + altura*2,1);
}

draw_sprite_ext(spr_target, 0, mx, my, 1, 1, 0, c_white, 1);
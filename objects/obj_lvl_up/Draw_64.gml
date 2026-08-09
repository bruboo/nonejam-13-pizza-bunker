


draw_set_color(c_black);
draw_set_alpha(.4);
draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(-1);

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);


var espaco = 10;


var largura = sprite_get_width(spr_escolha_botao);
var altura = sprite_get_height(spr_escolha_botao);

var _x = display_get_gui_width();
var pos_saida = saindo ? saida_x : 0;
entrada_x = lerp(entrada_x, 0, 0.3);

for (var i = 0; i < array_length(upgrade_escolha); i++)
{
    var carta = upgrade_escolha[i];
    var yy =  i * (altura + espaco);
	var alvo = 0;
	var alvo_escala = 1;
    if (point_in_rectangle(mx, my, _x - largura, yy, _x, yy + altura) && !saindo)
    {
		alvo = -2;
		alvo_escala = 1.05;
		var mostrar_desc = alvo_escala > 1;
		
        if (delay_clike <= 0 && mouse_check_button_pressed(mb_left))
	    {
	        carta.ativa();   // Executa aqui
			carta.nivel++;
	        saindo = true;
	    }
    }
	hover_scale[i] = lerp(hover_scale[i],alvo_escala,0.2);
	cima_x[i] = lerp(cima_x[i], alvo, 0.2);
    draw_sprite_ext(spr_escolha_botao,carta.frame,_x + cima_x[i] + entrada_x + pos_saida+5,yy,hover_scale[i],1,0,c_white,1);
	
	if (carta.nivel == carta.maximo - 1)
	{
	    draw_sprite_ext(spr_nivel_max, 0, _x + cima_x[i] + entrada_x + pos_saida + 5, yy, hover_scale[i], 1, 0, c_white, 1);
	}

	
		if(hover_scale[i] == 1.05)
		{
			var _desc_x = _x - cima_x[i] - entrada_x - pos_saida - sprite_get_width(spr_escolha_botao);
			var _desc_y = yy;

			draw_sprite_ext(spr_descri_lvl,carta.descricao,_desc_x,_desc_y,1,1,0,c_white,1);
		}

	
}

draw_sprite_ext(spr_target, 0, mx, my, 1, 1, 0, c_white, 1);
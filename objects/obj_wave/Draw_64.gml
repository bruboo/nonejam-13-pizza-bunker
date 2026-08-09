if(room == rm_01)
{
	var _tempo = floor(tempo_ms);

	var _min = _tempo div 60;
	var _seg = _tempo mod 60;

	var _min_txt = string(_min);
	if(string_length(_min_txt) < 2) _min_txt = "0" + _min_txt;

	var _seg_txt = string(_seg);
	if(string_length(_seg_txt) < 2) _seg_txt = "0" + _seg_txt;

	var _texto = _min_txt + ":" + _seg_txt;

	var _destino_y = 30;

	if(instance_exists(obj_upgrades_loja) || instance_exists(obj_lvl_up))
	{
	    _destino_y = -40;
	}

	timer_y = lerp(timer_y, _destino_y, 0.2);

	draw_numero_alinhado(spr_numeros_timer, _texto, display_get_gui_width() * 0.5, timer_y, 16, c_white, "center");
}

draw_set_color(c_white);


draw_text(100, 130, "FPS: " + string(fps));
draw_text(100, 150, "Inimigos: " + string(instance_number(obj_entidade_inimigo)));
draw_text(100, 170, "Pizzas: " + string(instance_number(obj_pizza_mae)));
draw_text(100, 190, "Particulas: " + string(instance_number(obj_part_star)));
draw_text(100, 110, "Particulassss: " + string(instance_number(obj_part_alpha)));
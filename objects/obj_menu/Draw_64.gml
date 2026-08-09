


//Desenhando o quadrado na tela de visão
draw_set_color(c_black);
draw_set_alpha(.5);
draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
draw_set_color(-1);

draw_sprite_ext(spr_wall,0,0,0,0.5,0.5,1,c_white,1);


var _x_text    =  display_get_gui_width()/2;
var _y_text    =  index ? display_get_gui_height()/2 - 45 : display_get_gui_height()/2 - round(45/2);

//Setando as variaveis
draw_set_font(global.fnt_pixel_30);
draw_set_halign(fa_center)
draw_set_valign(fa_middle);

for(var i = 0; i < array_length(menu[index]); i++)
{
	if(selector == i)draw_set_colour(#f9ca24);
	else{draw_set_colour(#f0f0f0)}

	draw_text(_x_text, _y_text + (i*45), menu[index][i]);
}

//Zerando as variaveis
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_colour(-1);


if(global.debug)
{
	draw_text(30, 30, "trans" + string(transition));
	draw_text(30, 60, "turn" + string(turn));
	draw_text(30, 90, "alpha" + string(turn));
}
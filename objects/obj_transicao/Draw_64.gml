//Desenhar uma tela preta se o room_target não existir
if(rectangle)
{
	//Desenhando o quadrado na tela de visão
	draw_set_color(#090a14);
	draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_color(-1);
}
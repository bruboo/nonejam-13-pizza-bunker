mouse_frame += mouse_speed;

if (mouse_frame >= sprite_get_number(spr_mouse_clica))
{
	mouse_frame = 0;
}

tutorial_estado();

if (botao_proxima != undefined)
{
	botao_proxima.update();
}
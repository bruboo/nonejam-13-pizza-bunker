draw_sprite_ext(sprite_tutorial,frame,0,0,1,1,0,c_white,tutorial_alpha);

if (tutorial_estado == tutorial_inicio)
{
	draw_sprite_ext(spr_mouse_clica,floor(mouse_frame),923,477,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_contrato)
{
	draw_sprite_ext(spr_contrato,0,display_get_gui_width() * 0.5,contrato_y,1,1,0,c_white,1);

	draw_sprite_ext(spr_caneta_tuto,0,caneta_x,caneta_y,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_assinatura)
{
	draw_sprite_ext(spr_contrato,0,display_get_gui_width() * 0.5,contrato_y,1,1,0,c_white,1);

	draw_sprite_ext(spr_assina,floor(assinatura_frame),display_get_gui_width() * 0.5,contrato_y,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_saida_contrato)
{
	draw_sprite_ext(spr_contrato,0,display_get_gui_width() * 0.5,contrato_y,1,1,0,c_white,1);

	draw_sprite_ext(spr_assina,sprite_get_number(spr_assina) - 1,display_get_gui_width() * 0.5,contrato_y,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_mandy ||
	tutorial_estado == tutorial_mandy_espera_saida ||
	tutorial_estado == tutorial_mandy_saida)
{
	draw_sprite_ext(spr_mandy_1,0,mandy_x,mandy_y,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_mandy_fim_entrada ||
	tutorial_estado == tutorial_mandy_fim)
{
	draw_sprite_ext(spr_mandy_fim,mandy_fim_frame,mandy_fim_x,mandy_y,1,1,0,c_white,1);
}

if (tutorial_estado == tutorial_mandy_fim)
{
	draw_sprite_ext(spr_mouse_clica,floor(mouse_frame),875,477,1,1,0,c_white,1);
}

if (botao_proxima != undefined)
{
	botao_proxima.draw();
}
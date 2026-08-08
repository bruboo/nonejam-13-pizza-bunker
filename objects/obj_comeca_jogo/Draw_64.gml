// tutorial
draw_sprite_ext(sprite_tutorial,frame,0,0,1,1,0,c_white,tutorial_alpha);


// mouse clicando
if(!mostrar_contrato)
{
	draw_sprite_ext(spr_mouse_clica,floor(mouse_frame),923,477,1,1,0,c_white,1);
}


// contrato
if(mostrar_contrato)
{
	draw_sprite_ext(spr_contrato,0,display_get_gui_width()*0.5,contrato_y,1,1,0,c_white,1);
}

// assinatura
if(assinando)
{
	draw_sprite_ext(spr_assina,floor(assinatura_frame),display_get_gui_width()*0.5,contrato_y,1,1,0,c_white,1);
}

// caneta
if(mostrar_caneta)
{
	draw_sprite_ext(spr_caneta_tuto,0,caneta_x,caneta_y,1,1,0,c_white,1);
}

if(mostrar_mandy && mandy_visivel)
{
	draw_sprite_ext(spr_mandy_1,0,mandy_x,mandy_y,1,1,0,c_white,1);
}
if(mostrar_mandy_fim)
{
	draw_sprite_ext(spr_mandy_fim,0,mandy_fim_x,mandy_y,1,1,0,c_white,1);
}
if(mandy_fim_ativa)
{
	draw_sprite_ext(spr_mandy_fim,mandy_fim_frame,mandy_fim_x,mandy_y,1,1,0,c_white,1);
	draw_sprite_ext(spr_mouse_clica,floor(mouse_frame),875,477,1,1,0,c_white,1);
}
if(botao_proxima != undefined)
{
	botao_proxima.draw();
}
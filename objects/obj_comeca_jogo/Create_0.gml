sprite_tutorial = spr_texto_inicial;

frame = 0;


// mouse tutorial
mouse_frame = 0;
mouse_speed = 0.15;


// contrato
mostrar_contrato = false;
contrato_y = -sprite_get_height(spr_contrato)-20;
contrato_y_final = 40;
contrato_saida_y = -sprite_get_height(spr_contrato) - 50;
fade_delay = 60; // tempo em frames esperando

// caneta
mostrar_caneta = false;


// assinatura
assinando = false;
assinatura_frame = 0;
assinatura_speed = 0.4;


// saída
subindo = false;
tutorial_alpha = 1;
mandy_entrada = false;
mostrar_mandy = false;

mandy_x = display_get_gui_width();
mandy_y = 0;


mandy_x_final = display_get_gui_width() - sprite_get_width(spr_mandy_1);

mandy_saindo = false;
mandy_x_saida = display_get_gui_width() + sprite_get_width(spr_mandy_1);

mandy_delay_saida = 0;
mandy_visivel = true;

mandy_fim_chamar = function()
{
	mostrar_mandy_fim = true;
	mandy_fim_entrando = true;

	mandy_fim_x = display_get_gui_width();
};
mostrar_mandy_fim = false;

mandy_fim_x = display_get_gui_width();
mandy_fim_x_final = display_get_gui_width() - sprite_get_width(spr_mandy_fim);
mandy_fim_entrando = false;

mandy_fim_frame = 0;
mandy_fim_ativa = false;
botao_proxima = undefined;


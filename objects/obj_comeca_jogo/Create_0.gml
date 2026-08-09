sprite_tutorial = spr_texto_inicial;

frame = 0;

// mouse tutorial
mouse_frame = 0;
mouse_speed = 0.15;

// contrato
contrato_y = -sprite_get_height(spr_contrato) - 20;
contrato_y_final = 40;
contrato_saida_y = -sprite_get_height(spr_contrato) - 50;
fade_delay = 60;

// caneta
caneta_x = 0;
caneta_y = 0;

// assinatura
assinatura_frame = 0;
assinatura_speed = 0.4;

// tutorial
tutorial_alpha = 1;

// Mandy
mandy_x = display_get_gui_width();
mandy_y = 0;

mandy_x_final = display_get_gui_width() - sprite_get_width(spr_mandy_1);

mandy_x_saida = display_get_gui_width() + sprite_get_width(spr_mandy_1);

mandy_delay_saida = 0;

// Mandy final
mandy_fim_x = display_get_gui_width();
mandy_fim_x_final = display_get_gui_width() - sprite_get_width(spr_mandy_fim);

mandy_fim_frame = 0;

botao_proxima = undefined;

mostrar_contrato = false;

contrato_y = -sprite_get_height(spr_contrato) - 20;
contrato_y_final = 40;
contrato_saida_y = -sprite_get_height(spr_contrato) - 50;

contrato_pronto = false;


tutorial_inicio = function()
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (frame < sprite_get_number(sprite_tutorial) - 1)
		{
			frame++;

			if (frame == sprite_get_number(sprite_tutorial) - 1)
			{
				contrato_y = -sprite_get_height(spr_contrato) - 20;
				tutorial_estado = tutorial_contrato;
			}
		}
	}
};

tutorial_contrato = function()
{
	contrato_y = lerp(contrato_y, contrato_y_final, 0.15);

	caneta_x = device_mouse_x_to_gui(0);
	caneta_y = device_mouse_y_to_gui(0);

	if (abs(contrato_y - contrato_y_final) < 1)
	{
		contrato_y = contrato_y_final;
		contrato_pronto = true;
	}

	if (!contrato_pronto) return;

	if (mouse_check_button_pressed(mb_left))
	{
		var _mx = device_mouse_x_to_gui(0);
		var _my = device_mouse_y_to_gui(0);

		var _x = display_get_gui_width() * 0.5;
		var _larg = sprite_get_width(spr_contrato);
		var _alt = sprite_get_height(spr_contrato);

		if (point_in_rectangle(_mx, _my, _x - _larg * 0.5, contrato_y, _x + _larg * 0.5, contrato_y + _alt))
		{
			assinatura_frame = 0;
			tutorial_estado = tutorial_assinatura;
		}
	}
};

tutorial_assinatura = function()
{
	assinatura_frame += assinatura_speed;

	if (assinatura_frame >= sprite_get_number(spr_assina))
	{
		assinatura_frame = sprite_get_number(spr_assina) - 1;
		fade_delay = 60;
		tutorial_estado = tutorial_saida_contrato;
	}
};

tutorial_saida_contrato = function()
{
	contrato_y = lerp(contrato_y,contrato_saida_y,0.15);

	if (contrato_y <= contrato_saida_y + 20)
	{
		if (fade_delay > 0)
		{
			fade_delay--;
		}
		else
		{
			tutorial_alpha = max(tutorial_alpha - 0.03,0);

			if (tutorial_alpha <= 0)
			{
				mandy_x = display_get_gui_width();
				tutorial_estado = tutorial_mandy_entrada;
			}
		}
	}
};

tutorial_mandy_entrada = function()
{
	mandy_x = approach(mandy_x,mandy_x_final,15);

	if (mandy_x == mandy_x_final)
	{
		mandy_delay_saida = 0;
		tutorial_estado = tutorial_mandy;
	}
};

tutorial_mandy = function()
{
	if (obj_player.velh != 0 || obj_player.velv != 0)
	{
		mandy_delay_saida = 100;
		tutorial_estado = tutorial_mandy_espera_saida;
	}
};

tutorial_mandy_espera_saida = function()
{
	if (mandy_delay_saida > 0)
	{
		mandy_delay_saida--;
	}
	else
	{
		tutorial_estado = tutorial_mandy_saida;
	}
};

tutorial_mandy_saida = function()
{
	mandy_x = approach(mandy_x,mandy_x_saida,15);

	if (mandy_x == mandy_x_saida)
	{
		tutorial_estado = tutorial_espera_mandy_fim;
	}
};

tutorial_espera_mandy_fim = function()
{
	
	
};

mandy_fim_chamar = function()
{
	mandy_fim_x = display_get_gui_width();
	tutorial_estado = tutorial_mandy_fim_entrada;
};

tutorial_mandy_fim_entrada = function()
{
	mandy_fim_x = approach(mandy_fim_x,mandy_fim_x_final,15);

	if (mandy_fim_x == mandy_fim_x_final)
	{
		mandy_fim_frame = 0;
		tutorial_estado = tutorial_mandy_fim;
	}
};

tutorial_mandy_fim = function()
{
	if (!mouse_check_button_pressed(mb_left)) return;

	if (mandy_fim_frame < sprite_get_number(spr_mandy_fim) - 1)
	{
		mandy_fim_frame++;
		return;
	}

	if (botao_proxima == undefined)
	{
		botao_proxima = ui_botao_slide(
			spr_proxima_wave,
			0,
			display_get_gui_width() - sprite_get_width(spr_proxima_wave) / 2,
			360,
			function()
			{
				scpt_transition_start(rm_01,-1,-1,seq_SlideOutDiagonal,seq_FadeIn);
			}
		);
	}

	tutorial_estado = tutorial_botao;
};

tutorial_botao = function()
{
	if (botao_proxima != undefined)
	{
		botao_proxima.update();
	}
};

tutorial_estado = tutorial_inicio;
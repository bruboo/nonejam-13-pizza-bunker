// anima mouse
mouse_frame += mouse_speed;

if(mouse_frame >= sprite_get_number(spr_mouse_clica))
{
	mouse_frame = 0;
}


// clique avança tutorial
if(!mostrar_contrato && mouse_check_button_pressed(mb_left))
{
	if(frame < sprite_get_number(sprite_tutorial) - 1)
	{
		frame++;

		if(frame == sprite_get_number(sprite_tutorial) - 1)
		{
			mostrar_contrato = true;
			mostrar_caneta = true;
		}
	}
}


// contrato descendo
if(mostrar_contrato && !subindo)
{
	contrato_y = lerp(contrato_y, contrato_y_final, 0.15);
}


// caneta segue mouse
if(mostrar_caneta)
{
	caneta_x = device_mouse_x_to_gui(0);
	caneta_y = device_mouse_y_to_gui(0);
}


// clique no contrato
if(mostrar_contrato && !assinando && !subindo)
{
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	var _x = display_get_gui_width() * 0.5;
	var _larg = sprite_get_width(spr_contrato);
	var _alt = sprite_get_height(spr_contrato);

	if(mouse_check_button_pressed(mb_left))
	{
		if(point_in_rectangle(_mx,_my,_x-_larg*0.5,contrato_y,_x+_larg*0.5,contrato_y+_alt))
		{
			assinando = true;
			assinatura_frame = 0;
			mostrar_caneta = false;
		}
	}
}


// anima assinatura
if(assinando)
{
	assinatura_frame += assinatura_speed;

	if(assinatura_frame >= sprite_get_number(spr_assina))
	{
		assinando = false;
		subindo = true;
	}
}


// sobe contrato e assinatura
if(subindo)
{
	contrato_y = lerp(contrato_y, contrato_saida_y, 0.15);

	if(contrato_y <= contrato_saida_y + 20)
	{
		if(fade_delay > 0)
		{
			fade_delay--;
		}
		else
		{
			tutorial_alpha -= 0.03;

			if(tutorial_alpha <= 0)
			{
				tutorial_alpha = 0;

				if(!mostrar_mandy)
				{
					mostrar_mandy = true;
					mandy_entrada = true;
				}
			}
		}
	}
}
if(mandy_entrada)
{
	mandy_x = approach(mandy_x, mandy_x_final, 15);

	if(mandy_x == mandy_x_final)
	{
		mandy_entrada = false;
		mandy_efeito = true;
	}
}
if(mostrar_mandy && !mandy_saindo && !mandy_entrada)
{
	if(keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("S")) || keyboard_check_pressed(ord("D")))
	{
		mandy_delay_saida = 200; // 30 frames de delay
	}
}

if(mandy_delay_saida > 0)
{
	mandy_delay_saida--;
	
	if(mandy_delay_saida <= 0)
	{
		mandy_saindo = true;
	}
}


if(mandy_saindo)
{
	mandy_x = approach(mandy_x, mandy_x_saida, 15);

	if(mandy_x == mandy_x_saida)
	{
		mandy_visivel = false;
		mandy_saindo = false;
	}
}

if(mandy_fim_entrando)
{
	mandy_fim_x = approach(mandy_fim_x, mandy_fim_x_final, 15);

	if(mandy_fim_x == mandy_fim_x_final)
	{
		mandy_fim_entrando = false;
		mandy_fim_ativa = true;
	}
}
if (mandy_fim_ativa && mouse_check_button_pressed(mb_left))
{
	if (mandy_fim_frame < sprite_get_number(spr_mandy_fim) - 1)
	{
		mandy_fim_frame++;
	}
	else
	{
		if (botao_proxima == undefined)
		{
			botao_proxima ??= ui_botao_slide(
				spr_proxima_wave,
				0,
				display_get_gui_width() - sprite_get_width(spr_proxima_wave)/2,
				360,
				function()
				{
					room_goto(rm_01);
					//scpt_transition_start(rm_01,-1,-1,seq_SlideInDiagonal,seq_SlideOutDiagonal)
					
					instance_destroy();
				}
			);
		}

		mandy_fim_ativa = false;
	}
}

if (botao_proxima != undefined)
{
	botao_proxima.update();
}
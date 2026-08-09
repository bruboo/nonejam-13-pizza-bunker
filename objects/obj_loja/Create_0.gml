sinaliza_frame = 0;
sinaliza_speed = 0.03;

estado = "fechada";
depth = -y;

botao_x = display_get_gui_width() + sprite_get_width(spr_proxima_wave);
botao_x_final = display_get_gui_width() - sprite_get_width(spr_proxima_wave)/2 + 10;

botao_offset = 0;
botao_entrou = false;
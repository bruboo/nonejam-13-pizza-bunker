sprite = spr_vem_wave;

x = -sprite_get_width(sprite);
y = 0;

x_final = 100;

vel_entrada = 0.1;
vel_saida = 0.09;

tempo_espera = 100;
timer = 0;

estado = 0;
// 0 = entrando
// 1 = esperando
// 2 = saindo
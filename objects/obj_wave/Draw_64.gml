var minutos = floor(tempo_jogo / 60);
var segundos = floor(tempo_jogo mod 60);

var texto = string_format(minutos, 2, 0) + ":" + string_format(segundos, 2, 0);

draw_text_ext_transformed(550, 32, texto,5,100,3,3,1);

draw_text_ext_transformed(650, 650, obj_player.vida,5,100,3,3,1);
draw_text_ext_transformed(530, 650, "vida",5,100,3,3,1);
draw_text_ext_transformed(30, 32, obj_player.xp,5,100,3,3,1);


draw_sprite_ext(spr_target,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1,1,0,c_white,1);


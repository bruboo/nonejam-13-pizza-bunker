
//Desenhando a sprite
draw_set_alpha(alpha);

var _x1 = _x ? _x : x;
var _y1 = _y ? _y : y;

//Caso eu não esteja no controle
if(global.gamepadID == -50 and sprite_teclado)draw_sprite(sprite_teclado, current_time / 400, _x1, _y1);

//Caso eu esteja no controle
//Caso eu não esteja no controle
if(global.gamepadID != -50 and sprite_controle)draw_sprite(sprite_controle, current_time / 400, _x1, _y1);

draw_set_alpha(1);

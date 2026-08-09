x = mouse_x;
y = mouse_y;

var _tocando = place_meeting(x,y,colisao);

image_blend = _tocando ? c_red : c_white;

if (!_tocando && mouse_check_button_pressed(mb_left))
{
	global.bloquear_ataque = false;
    confirmado = true;

    instance_create_layer(x, y, "chao", obj_pimenta_chao);
    instance_destroy();
}

if (mouse_check_button_pressed(mb_right))
{
    pimenta.ocupado = false;
    global.bloquear_ataque = false;
    instance_destroy();
}
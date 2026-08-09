// Inherit the parent event
if(global.parar)
{
	velh = 0;
	velv = 0;
	return;
}
slow = 1;
depth = -y;
if (place_meeting(x, y, obj_slow))
{
    slow = 0.5;
}
estado();


if (queimando)
{
	tempo_queimando--;
	timer_fogo--;

	if (timer_fogo <= 0)
	{
		toma_dano_fogo();
		timer_fogo = intervalo_fogo;
	}

	if (tempo_queimando <= 0)
	{
		queimando = false;
	}
}









escala_dano = lerp(escala_dano, 1, 0.15);

image_yscale = escala_dano;

if (velh > 0)
    image_xscale = escala_dano;
else if (velh < 0)
    image_xscale = -escala_dano;
dano_flash = lerp(dano_flash, 0, 0.1);
image_blend = merge_color(c_white, c_red, dano_flash);

// colisão com player
var _player = instance_place(x,y,obj_player);

if (_player != noone)
{
	if (_player.toma_dano(dano))
	{
		
		flash(c_red);
		create_part(0,10,25,x,y,velh,velv);
	}
}






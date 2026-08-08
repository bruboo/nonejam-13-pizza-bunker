// Inherit the parent event
if(global.parar)
{
	velh = 0;
	velv = 0;
	return;
}

estado();



image_xscale = lerp(image_xscale, 1, 0.15);
image_yscale = lerp(image_yscale, 1, 0.15);



// colisão com player
var _player = instance_place(x,y,obj_player);

if (_player != noone)
{
	if (_player.toma_dano(dano))
	{
		flash(c_red);
		image_xscale = 1.5;
		image_yscale = 1.5;

		create_part(0,10,25,x,y,velh,velv);
		create_part(2,10,25,x,y,velh,velv);
	}
}






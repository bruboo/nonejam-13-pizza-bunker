if(global.parar)
{
	velh = 0;
	velv = 0;
	return;
}

velh = (global._key_right - global._key_left) * 10;
velv = (global._key_down - global._key_up) * 10;

//O player é um listener
audio_listener_position(x, y, 0);


if(timer_invencivel > 0)
{
	timer_invencivel--;
}


if(timer_invencivel > 0)
{
	visivel = !visivel;
}
else
{
	visivel = true;
}


if(vida < 0)
{
	show_message("morreu")
	game_end();
}


image_xscale = lerp(image_xscale, 1, 0.15);
image_yscale = lerp(image_yscale, 1, 0.15);

if(timer_tiro > 0) timer_tiro--;

if(mouse_check_button(mb_left))
{
	if(timer_tiro <= 0)
	{
		image_xscale = 1.3;
		image_yscale = 1.3;
		var _tiro = instance_create_layer(x,y-24,layer,obj_pizza);	
		var dir = point_direction(x, y, mouse_x, mouse_y);
		timer_tiro = atk_speed;
	    _tiro.velh = lengthdir_x(_tiro.vel, dir);
	    _tiro.velv = lengthdir_y(_tiro.vel, dir);
	}
}
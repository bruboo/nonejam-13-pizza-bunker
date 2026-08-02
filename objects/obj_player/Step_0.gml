if(global.parar)
{
	velh = 0;
	velv = 0;
	return;
}

if(instance_exists(obj_lvl_up))
{
	vida = vida_max;
}



while (xp >= proximo_lvl)
{
    lvl++;
	proximo_lvl += 4 + floor(lvl * 0.8);
	lvl_stack++;  
}

if (lvl_stack > 0 && !instance_exists(obj_lvl_up))
{
    instance_create_layer(x, y, layer, obj_lvl_up);
    lvl_stack--;
}








velh = (global._key_right - global._key_left) * move_speed;
velv = (global._key_down - global._key_up) * move_speed;

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

if(atk_speed > 0) atk_speed--;

if(mouse_check_button(mb_left))
{
	if(atk_speed <= 0)
	{
		image_xscale = 1.3;
		image_yscale = 1.3;
		var _tiro = instance_create_layer(x,y-24,layer,obj_pizza);	
		var dir = point_direction(x, y, mouse_x, mouse_y);
		atk_speed = timer_tiro;
	    _tiro.velh = lengthdir_x(_tiro.vel, dir);
	    _tiro.velv = lengthdir_y(_tiro.vel, dir);
	}
}
event_inherited()


timer_particula++;

if (timer_particula >= intervalo_particula)
{
	timer_particula = 0;
	var _x_part = x + random_range(-sprite_get_width(sprite_index) / 2, sprite_get_width(sprite_index) / 2);
	var _y_part = y + random_range(-sprite_get_height(sprite_index) / 2, sprite_get_height(sprite_index) / 2);


	create_part(7,20,50,_x_part,_y_part,0,0);
	
}

if (timer_alpha > 0)
{
	timer_alpha--;
}
else
{
	image_alpha -= alpha_vel;

	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}
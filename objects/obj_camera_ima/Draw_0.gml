if(global.debug)
{
	draw_self();
	
	draw_set_colour(c_red);
	draw_set_alpha(.4);
	draw_circle(x, y, forca_ima, false);
	draw_set_colour(-1);
	draw_set_alpha(1);
}


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
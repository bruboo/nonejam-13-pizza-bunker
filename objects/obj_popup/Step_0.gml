y += vel_y;

alpha = timer / 40;

timer--;

if(timer <= 0)
{
	instance_destroy();
}
depth = -y;

life--;

velh = lerp(velh, 0, 0.04);
velv = lerp(velv, 0, 0.04);

if (abs(velh) <= 0.8 && abs(velv) <= 0.8)
{
	image_xscale = lerp(image_xscale, 0, 0.08);
	image_yscale = lerp(image_yscale, 0, 0.08);
}

if (image_xscale <= 0.01)
{
	instance_destroy();
}

x += velh;
y += velv;
with(obj_player)
{
	cash += 4;
	image_xscale = 1.3;
	image_yscale = 1.3;
}
create_part(3,10,15,x,y-16,velh,velv);
scpt_audio_play_sound(snd_estrela);
instance_destroy();
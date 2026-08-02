//Se o player encostar no tutorial
if(instance_place(x, y, global.player))
{
	//Diminuo o tempo do tutorial
	if(tempo_tutorial)tempo_tutorial = approach(tempo_tutorial, 0, 1);
	else//Cquando ele acabar
	{
		if(alpha < 1)
		{
			//if(alpha == 0)scpt_audio_play_sound(snd_tutorial, 10, false);
			alpha = approach(alpha, 1, .2)
		};
	}
}
else
{
	tempo_tutorial = temporizador_tutorial;
	if(alpha > 0)
	{
		alpha = approach(alpha, 0, .05);
		if(!alpha)instance_destroy()
	}
}



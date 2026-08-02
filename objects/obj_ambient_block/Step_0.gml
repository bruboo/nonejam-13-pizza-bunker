//Caso eu encostar no player
if(instance_place(x, y, global.player))
{
	//Setar o a música
	set_ambient_ingame(Song, FadeOut, FadeIn, SongOverlap);
}
//Caso eu encostar no player
if(instance_place(x, y, global.player))
{
	//Setar o a música
	set_song_ingame(Song, FadeOut, FadeIn, SongOverlap);
}
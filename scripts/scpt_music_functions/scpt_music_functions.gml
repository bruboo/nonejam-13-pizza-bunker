///@function set_song_ingame(musica, [terminando], [comecando], [pular])
function set_song_ingame(_song, _fadeOutCurrentSong = 60, _fadeIn = 60, _songOverlap = false)
{
	//song                = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn             = time (in frames) the target song (if not "noone") will take to fade in
	//_songOverlap        = should the new song overlap with any old songs playing
	
	with(obj_music_manager)
	{
		target_song_asset = _song;
		endFadeOutTime    = _fadeOutCurrentSong;
		startFadeInTime   = _fadeIn;
		songOverlap       = _songOverlap;
	}
}

///@function set_ambient_ingame(música, [Terminando], [Começando], [Pular])
function set_ambient_ingame(_song, _fadeOutCurrentSong = 60, _fadeIn = 60, _songOverlap = false)
{
	//song                = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn             = time (in frames) the target song (if not "noone") will take to fade in
	//_songOverlap        = should the new song overlap with any old songs playing
	
	with(obj_ambient_manager)
	{
		target_song_asset = _song;
		endFadeOutTime    = _fadeOutCurrentSong;
		startFadeInTime   = _fadeIn;
		songOverlap       = _songOverlap;
	}
}

///@function scpt_audio_play_sound(song, [priority], [loop])
function scpt_audio_play_sound(_song, _priority = 6, _loop = 0)
{
	if (audio_is_playing(_song)){audio_stop_sound(_song)};
	{audio_play_sound(_song, _priority, _loop)}
}
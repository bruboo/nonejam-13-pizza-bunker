//Info for the sond we are currently playing / trying to play
song_instance	  = noone;
song_asset		  = noone;
target_song_asset = noone;
endFadeOutTime    = 0;//how many frames to fade out the song currently playing
startFadeInTime   = 0;//how many frames to fade in the new song
fadeInInstVol     = 1;//the volume of song_instance

//for fading music out and stopping songs that are no longer playing
fadeOutInstances  = array_create(0);//the audio instances to fade out
fadeOutInstVol    = array_create(0);//the volumes of each individual audio instance
fadeOutInstTime   = array_create(0);//how fast the fadeout should happen

songOverlap       = false;

#region DEBUG
//Variaveis
debug_view = noone;
debug_section = [];

set_song_start = 0;
set_song_end = 0;

//Método de debug do jogo
roda_debug = function()
{
	if(!DEBUG_MODE)return;
	
	//Se não ta em debug, ele só sai do método
	if(!is_debug_overlay_open())
	{
		if(!dbg_view_exists(debug_view))return;
		
		//Destruindo as sessões
		for(var i = 0; i < array_length(debug_section); i++)
		{
			//Caso exista uma sessão eu deleto ela
			if(dbg_section_exists(debug_section[i]))dbg_section_delete(debug_section[i])
			//Retiro o valor da array
			array_delete(debug_section, i , 1);
		}
		
		//Destruindo a view
		dbg_view_delete(debug_view);
	}else
	{
		if(!audio_is_playing(song_instance))return;
		
		//Duração em segundos
		//Pegando o momento atual da musica
		//S[o faço isso se o som atual está tocando
		//Caso contrário o meu pos atual vai ser 0
		var _pos_atual = audio_sound_get_track_position(song_instance);
		//Convertendo o momento atual em minutos
		var _mins_atual= _pos_atual div 60;
		//Convertendo o momento atual em segundos
		var _seg_atual = round(_pos_atual % 60);

		//Peguei os minutos da duração
		var _mins_musica = audio_sound_length(song_instance) div 60;
		//Retirei os minutos da duração para ter os segundos que restam
		var _segs_musica = round(audio_sound_length(song_instance) % 60);
		
		_sound_name = string_replace_all(string_delete(audio_get_name(song_instance), 0, 4), "_", " ");
		
		_txt = string("{2}:{3} / {0}:{1}", _mins_musica, _segs_musica, _mins_atual, _seg_atual);
		
		_loop = [audio_sound_get_loop_start(song_instance), audio_sound_get_loop_end(song_instance)]
		
		if(!dbg_view_exists(debug_view))
		{
			//Criando meus bagui de debug dentro do view
			debug_view = dbg_view("Musica Manager", 1, 40, 40, 300, 400);
			
			//Criando a sessão primaria
			array_push(debug_section, dbg_section("Informações", true));
			
			//Qual musica está tocando?
			dbg_watch(ref_create(id, "_sound_name"), "Musica:");

			//Colocando a duração
			dbg_watch(ref_create(id, "_txt"), "Duração:");
			
			//Criando a sessão dos loops
			array_push(debug_section, dbg_section("LOOPs", false));
			
			dbg_watch(ref_create(id, "_loop", 0), "LOOP Start");
			dbg_watch(ref_create(id, "_loop", 1), "LOOP End");
			
			//Fazendo os sliders para mudar o começo e o final
			dbg_slider(ref_create(id, "set_song_start"), 0, audio_sound_length(song_instance), "set song loop start", .1);
			dbg_slider(ref_create(id, "set_song_end"), set_song_start, audio_sound_length(song_instance), "set song loop end", .1);
			
			dbg_button("Application loop", function()
			{
				audio_sound_loop_end(song_instance, set_song_end);
				audio_sound_loop_start(song_instance, set_song_start);
			});
		};
	};
};
#endregion
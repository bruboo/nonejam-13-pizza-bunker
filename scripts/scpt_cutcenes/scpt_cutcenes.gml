function action_end(){
	with(obj_par_cutscene){
		//Indo para a próxima ação
		action++;
		//Caso tenha terminado
		if (action >= array_length(cutscene)){
			//Me destruo
			instance_destroy();
		}
	}
}

/// @function cutscene_wait(_seconds)
function cutscene_wait(_seconds){
	//Incrementando o valor do timer
	timer++;
	if (timer >= fps * _seconds)
	{
		//Zerando o valor
		timer = 0;
		//Indo para a próxima ação
		action_end();
	}
}

/// @function cutscene_move_character(_id, _x, _y, [_relative], [_spr])
function cutscene_move_character(_id, _x, _y, _relative = false, _spd = 1){
	//Caso a instancia exista
	if(instance_exists(_id))
	{
		if (x_dest == -1){
			if (_relative == false){
				x_dest = _x;
				y_dest = _y;
			}else{
				x_dest = _id.x + _x;
				y_dest = _id.y + _y;
			}
		}
			var _xx = x_dest;
			var _yy = y_dest;
		
			with(_id){
				if point_distance(x, y, _xx, _yy) >= _spd {
					var _dir = point_direction(x, y, _xx, _yy);
					var _hspd = lengthdir_x(_spd, _dir);
					var _vspd = lengthdir_y(_spd, _dir);
				
					x += _hspd;
					y += _vspd;
				}else{
					x = _xx;
					y = _yy;
				
					obj_par_cutscene.x_dest = -1;
					obj_par_cutscene.y_dest = -1;
					action_end();
			}
		}
	}//Caso não exista eu vou para a proxima função
	else
	{
		action_end();
	}
}

/// @function cutscene_play_sound(_sound, _loop)
function cutscene_play_sound(_snd, _loop){
	audio_play_sound(_snd, 1, _loop);
	action_end();
}

/// @function cutscene_stop_sound(_sound)
function cutscene_stop_sound(_snd){
	audio_stop_sound(_snd);
	action_end();
}

/// @function cutscene_set_song_ingame(_song, [_fadeOutCurrentSong], [_fadeIn], [_songOverLap], [_trackPosition])
function cutscene_set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0, _songOverlap = false, _track_position = -1){
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
		track_position	  = _track_position;
	}
	action_end();
}

/// @function cutscene_instance_create(_x, _y, _layer, _obj)
function cutscene_instance_create(_x, _y, _layer, _obj){
	instance_create_layer(_x, _y, _layer, _obj);
	action_end();
}

/// @function cutscene_instance_destroy(_obj)
function cutscene_instance_destroy(_obj){
	instance_destroy(_obj);
	action_end();
}

/// @function cutscene_change_sprite(_id, _spr)
function cutscene_change_sprite(_id, _sprites_index){
	if(_id.image_ind + _id.image_spd >= _id.image_numb)
	{
		_id.sprites_index = _sprites_index;
		action_end();
	}
}

/// @function cutscene_change_variable(_id, _varstring, _value)
function cutscene_change_variable(_id, _varstring, _value){
	if(instance_exists(_id)){variable_instance_set(_id, _varstring, _value)};
	action_end();
}

/// @function cutscene_change_room([roomTarget], [x], [y], [typeOut], [typeIn])
function cutscene_change_room(_roomTagert = 0, _x = 0, _y = 0, _typeOut = seq_FadeOut, _typeIn = seq_FadeIn){
	//Iniciando a cutscene
	scpt_transition_start(_roomTagert, _x, _y, _typeOut, _typeIn);
	
	//Passando pra proxima ação
	action_end();
}

/// @function custecene_screem_shake([stop], [tempo], [speed])
function cutscene_screem_shake(_stop = true, _tempo = 15, _speed = 5){
	//enviando o codigo de screem_shake
	scpt_screenshake(_tempo, _speed);
	
	timer++;
	if (timer >= fps * _tempo_shake || _stop){
		timer = 0;
		action_end();
	}
}

/// @cutscene_instance_exist(id, [exist])
function cutscene_instance_exist(_id, _exist = true)
{
	//Caso o objeto seja sobre o objeto existir
	if(_exist){if(instance_exists(_id))action_end();}
	
	//Caso seja sobre o objeto não existir
	if(!_exist){if(!instance_exists(_id))action_end();}
}

/// @cutscene_nothing()
function cutscene_nothing()
{
	//Nada, só esperando um outro lugar passar para a próxima função
}

/// @cutscene_audio_set_loop(song, start, end)
function cutscene_audio_set_loop(_song, _start, _end)
{	
	//Setando o loop da musica
	audio_sound_loop_end(  _song, _end);
	audio_sound_loop_start(_song, _start);
	
	if(audio_sound_get_loop_start(_song) == _start and audio_sound_get_loop_end(_song) == _end)
	{
		//Passando para proxima ação
		action_end();
	}
}
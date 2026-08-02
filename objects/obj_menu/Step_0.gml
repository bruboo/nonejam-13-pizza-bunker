//Andando pelo menu
if(global._key_up_press and !pressed){selector--; };
if(global._key_down_press and !pressed){selector++;};

selector = clamp(selector, 0, array_length(menu[index])-1);

if(global._key_interate)
{
	switch(index)
	{
		case enum_menu.Main:
		{
			switch(selector)
			{
				case 0:
					if(Type)
					{
						instance_destroy();
					}else
					{
						room_goto(rm_01);
					}
				break;
				
				case 1:
					//Vou para as configurações
					index	 = 1;
					selector = 0;
				break;
				
				case 2:
					//Jogo termina
					game_end();
				break;
			}
		}
		break;
		
		case enum_menu.Settings:
		{
			switch(selector)
			{
				case 0:
					//Toggle para a tela cheia
					window_set_fullscreen(!window_get_fullscreen());
				break;
				
				case 3:
					//Volto para a main
					index    = 0;
					selector = 0;
				break;
			}
		}
		break;
	}
	
	//Resetando os names
	menu_name_reset();
}

switch(index)
{	
	case enum_menu.Settings:
	{
		switch(selector)
		{
			case 0://Mudando a tela cheia
				
				//Fullscreen falso
				if(global._key_left_press and !pressed)
				{
					window_set_fullscreen(false);
					//Resetando os names
					menu_name_reset();
				}
				
				//Fullscreen true
				if(global._key_right_press and !pressed)
				{
					window_set_fullscreen(true);
					//Resetando os names
					menu_name_reset();
				}
			break;
			
			case 1://Mudando o volume da musica
				
				//Baixando o volume
				if(global._key_left_press and !pressed and audio_group_get_gain(audiogroup_music) > 0)
				{
					audio_group_set_gain(audiogroup_music, audio_group_get_gain(audiogroup_music) - .1);
					//Resetando os names
					menu_name_reset();
				}
				
				//Aumentando o volume
				if(global._key_right_press and !pressed and audio_group_get_gain(audiogroup_music) < 1)
				{
					audio_group_set_gain(audiogroup_music, audio_group_get_gain(audiogroup_music) + .1);
					//Resetando os names
					menu_name_reset();
				}
			break;
			
			case 2:
				//Baixando o volume
				if(global._key_left_press and !pressed and audio_group_get_gain(audiogroup_sound_effect) > 0)
				{
					audio_group_set_gain(audiogroup_sound_effect, audio_group_get_gain(audiogroup_sound_effect) - .1);
					//Resetando os names
					menu_name_reset();
				}
				
				//Aumentando o volume
				if(global._key_right_press and !pressed and audio_group_get_gain(audiogroup_sound_effect) < 1)
				{
					audio_group_set_gain(audiogroup_sound_effect, audio_group_get_gain(audiogroup_sound_effect) + .1);
					//Resetando os names
					menu_name_reset();
				}
			break;
		}
	}
	break;
}

//Caso ele seja um pause
if(Type)
{
	//E o player aperte o botão de esc dnv
	if(global._key_esc)
	{
		instance_destroy();
	}
}
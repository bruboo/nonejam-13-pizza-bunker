enum enum_menu
{
	Main,
	Settings
}

menu_name_reset = function()
{
	var _menu_boolean = Type ? "Retomar" : "Jogar"
	menu[enum_menu.Main][0] = _menu_boolean;
	menu[enum_menu.Main][1] = "Configurações";
	menu[enum_menu.Main][2] = "Sair";

	var _fullscreen_boolean = window_get_fullscreen() ? "Sim" : "Não";
	menu[enum_menu.Settings][0] = "Tela cheia:"   + _fullscreen_boolean;
	menu[enum_menu.Settings][1] = "Volume music:" + string(round(audio_group_get_gain(audiogroup_music) * 100)) + "%";
	menu[enum_menu.Settings][2] = "Volume sfx:"   + string(round(audio_group_get_gain(audiogroup_sound_effect) * 100)) + "%";
	menu[enum_menu.Settings][3] = "Back";
}

menu_name_reset();

index		 = 0;
selector	 = 0;
pressed		 = 0;

menu_subimg	 = 0;
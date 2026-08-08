


if (delay_clike > 0)
{
    delay_clike--;
}

if (saindo)
{
    saida_x = lerp(saida_x, display_get_gui_width(), 0.1);

    if (saida_x > display_get_gui_width() - 10)
    {
        instance_destroy();
    }
}


//if(keyboard_check_pressed(vk_numpad2))
//{
	
//	obj_player.vida_max += 1;
//}
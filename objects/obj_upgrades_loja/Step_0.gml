


if (delay_clike > 0)
{
    delay_clike--;
}



if (saindo)
{
    saida_y = lerp(saida_y, -display_get_gui_height(), 0.15);

    if (saida_y < -display_get_gui_height() + 100)
    {
		global.bloquear_ataque = false;
        instance_destroy();
    }
}





//if(keyboard_check_pressed(vk_numpad2))
//{
	
//	obj_player.vida_max += 1;
//}
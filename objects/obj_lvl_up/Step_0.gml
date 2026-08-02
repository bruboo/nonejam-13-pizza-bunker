if(keyboard_check_pressed(vk_numpad5))
{
	instance_destroy();
}
if (carta_selecionada != -1 && !saindo)
{
    upgrade_escolha[carta_selecionada].ativa();
    carta_selecionada = -1;
}

if (saindo)
{
    saida_x = lerp(saida_x, display_get_gui_width()*2, 0.1);

    if (saida_x > display_get_gui_width() - 10)
    {
        instance_destroy();
    }
}
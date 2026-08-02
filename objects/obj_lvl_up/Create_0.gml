

upgrades = [

/////////
		{
			frame:1,
			ativa: function()
			{
				obj_player.dano_bonus += 1;
			}
		},
/////////
		{
			frame:3,
			ativa: function()
			{
				obj_player.vida_max += 2;
				obj_player.vida += 2;
			}
		},
/////////
		{
			frame:4,
			ativa: function()
			{
				obj_player.atk_speed -= 5;
			}
		},
/////////
		{
			frame:0,
			ativa: function()
			{
				obj_player.move_speed += 1;
			}
		},
/////////
		{
			frame:2,
			ativa: function()
			{
				obj_player.res_pizza += 1;
			}
		}




]



upgrade_escolha = [];

var usados = [];

repeat(3)
{
    var indice;
    var repetido;

    do
    {
        indice = irandom(array_length(upgrades) - 1);

        repetido = false;

        for (var i = 0; i < array_length(usados); i++)
        {
            if (usados[i] == indice)
            {
                repetido = true;
                break;
            }
        }

    } until (!repetido);

    array_push(usados, indice);
    array_push(upgrade_escolha, upgrades[indice]);
}


hover_x = [];
for (var i = 0; i < array_length(upgrade_escolha); i++) hover_x[i] = 0;
carta_selecionada = -1;
saindo = false;
saida_x = 0;
entrada_x = display_get_gui_width();














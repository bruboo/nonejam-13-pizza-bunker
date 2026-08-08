

upgrades = [

/////////
		{
			frame:0,
			descricao:0,
			ativa: function()
			{
				obj_player.dano_bonus += 1;
			}
		},
/////////
		{
			frame:1,
			descricao:1,
			ativa: function()
			{
			        obj_player.vida_max += 2;
					obj_player.vida += 2;
			}
		},
/////////
		{
			frame:2,
			descricao:2,
			ativa: function()
			{
				obj_player.timer_tiro -= 3;
			}
		},
/////////
		{
			frame:3,
			descricao:3,
			ativa: function()
			{
				obj_player.move_speed += 1;
			}
		},
/////////
		{
			frame:4,
			descricao:4,
			ativa: function()
			{
				obj_player.res_pizza += 1;	
			}
		},
/////////		
		{
			frame:5,
			descricao:5,
			ativa: function()
			{
				obj_player.rastro_de_fogo_ativo = true;	
			}
		},
		/////////		
		{
			frame:6,
			descricao:6,
			ativa: function()
			{
				obj_player.rastro_de_queijo_ativo = true;	
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

//mouse em cima do bgl
cima_x = [];
hover_scale = [];
for (var i = 0; i < array_length(upgrade_escolha); i++) 
{
	cima_x[i] = 0;
	hover_scale[i] = 1;
}
carta_selecionada = -1;

//carta sai pra direita
saindo = false;
saida_x = 0;
//carta entra pra esquerda
entrada_x = display_get_gui_width();

//pro cara nao clica sem querer
//usar pra fazer uma identificaçao visual pra conde pode clicar
delay_clike = 25;


desc_scale = [];

for(var i = 0; i < array_length(upgrade_escolha); i++)
{
	desc_scale[i] = 0;
}












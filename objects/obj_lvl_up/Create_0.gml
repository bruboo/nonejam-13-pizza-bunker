
obj_player.vida = obj_player.vida_max;


upgrade_escolha = [];

var _disponiveis = [];

for (var i = 0; i < array_length(global.player_upgrades); i++)
{
	if (global.player_upgrades[i].nivel < global.player_upgrades[i].maximo)
	{
		array_push(_disponiveis, i);
	}
}

var _qtd = min(3, array_length(_disponiveis));

repeat(_qtd)
{
	var _posicao = irandom(array_length(_disponiveis) - 1);
	var _indice = _disponiveis[_posicao];

	array_push(upgrade_escolha, global.player_upgrades[_indice]);

	array_delete(_disponiveis, _posicao, 1);
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












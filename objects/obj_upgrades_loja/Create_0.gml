


upgrade_escolha = global.upgrades_loja;


//mouse em cima do bgl
cima_x = [];
for (var i = 0; i < array_length(upgrade_escolha); i++) cima_x[i] = 0;
carta_selecionada = -1;

//carta sai pra direita
saindo = false;

//carta entra 
entrada_y = -display_get_gui_height();
saida_y = 0;

//pro cara nao clica sem querer
//usar pra fazer uma identificaçao visual pra conde pode clicar
delay_clike = 25;

click_scale = [];

for (var i = 0; i < array_length(upgrade_escolha); i++)
{
    click_scale[i] = 1;
}




draw_numero_alinhado = function(_sprite, _valor, _x, _y, _espaco, _cor, _align, _escala)
{
    var _texto = string(_valor);
    var _largura = string_length(_texto) * _espaco * _escala;

    var _inicio_x = _x;

    if (_align == "center")
    {
        _inicio_x = _x - _largura * 0.5;
    }
    else if (_align == "right")
    {
        _inicio_x = _x - _largura;
    }

    for (var i = 1; i <= string_length(_texto); i++)
    {
        var _numero = real(string_char_at(_texto, i));

        draw_sprite_ext(_sprite, _numero, _inicio_x + (i - 1) * _espaco * _escala, _y, _escala, _escala, 0, _cor, 1);
    }
}








valor = 0;

timer = 40;

vel_y = -1.2;

alpha = 1;

draw_numero_alinhado = function(_sprite, _valor, _x, _y, _espaco, _cor, _align)
{
    var _texto = string(_valor);
    var _largura = string_length(_texto) * _espaco;

    var _inicio_x = _x;

    if (_align == "center")
        _inicio_x = _x - _largura * 0.5;
    else if (_align == "right")
        _inicio_x = _x - _largura;

    for (var i = 1; i <= string_length(_texto); i++)
    {
        var _char = string_char_at(_texto, i);
        var _frame;

        if (_char == ":")
            _frame = 10;
        else
            _frame = real(_char);

        draw_sprite_ext(_sprite, _frame, _inicio_x + (i - 1) * _espaco, _y, 1, 1, 0, _cor, 1);
    }
}
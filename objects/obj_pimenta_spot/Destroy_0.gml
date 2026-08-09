if (confirmado)
{
    var _indice = -1;

    for (var i = 0; i < array_length(global.pimenta); i++)
    {
        if (global.pimenta[i] == pimenta)
        {
            _indice = i;
            break;
        }
    }

    if (_indice != -1)
    {
        array_delete(global.pimenta, _indice, 1);
        array_delete(global.pimenta_offset, _indice, 1);
    }
}
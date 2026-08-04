if (confirmado)
{
    var _indice = -1;

    for (var i = 0; i < array_length(global.fornos); i++)
    {
        if (global.fornos[i] == forno)
        {
            _indice = i;
            break;
        }
    }

    if (_indice != -1)
    {
        array_delete(global.fornos, _indice, 1);
        array_delete(global.fornos_offset, _indice, 1);
    }
}
if (confirmado)
{
    var _indice = -1;

    for (var i = 0; i < array_length(global.queijos); i++)
    {
        if (global.queijos[i] == queijo)
        {
            _indice = i;
            break;
        }
    }

    if (_indice != -1)
    {
        array_delete(global.queijos, _indice, 1);
        array_delete(global.queijos_offset, _indice, 1);
    }
}
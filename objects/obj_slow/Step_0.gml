
var _lista = ds_list_create();

instance_place_list(x, y, obj_entidade_inimigo, _lista, false);

for (var i = 0; i < ds_list_size(_lista); i++)
{
    var _inimigo = _lista[| i];
    _inimigo.slow = slow;
}

ds_list_destroy(_lista);
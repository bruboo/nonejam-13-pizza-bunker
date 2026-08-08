var _lista = ds_list_create();

var _qtd = instance_place_list(x, y, obj_entidade_inimigo, _lista, false);

for (var i = 0; i < _qtd; i++)
{
	var _inimigo = _lista[| i];
	_inimigo.toma_dano(0,0,obj_forno.dano_base);
}

ds_list_destroy(_lista);

instance_destroy();
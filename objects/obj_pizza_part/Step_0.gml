var _lista = ds_list_create();

var _qtd = instance_place_list(x, y, obj_entidade_inimigo, _lista, false);

if (_qtd > 0)
{
    for (var i = 0; i < _qtd; i++)
    {
        var _inimigo = _lista[| i];
        _inimigo.toma_dano(0, 0, 0);
    }

    instance_destroy();
}

ds_list_destroy(_lista);

timer--;
if (timer <= 0)
{
	create_part(5,10,10,x,y,velh,velv);
    instance_destroy();
    exit;
}



var passos = ceil(max(abs(velh), abs(velv)));

if (passos < 1)
{
    passos = 1;
}


// Se a pizza nasceu dentro da parede
if (place_meeting(x, y, obj_colisor))
{
	create_part(1,10,10,x,y,velh,velv);
    instance_destroy();
    exit;
}




//colisao da pizza
repeat(passos)
{
    var mov_x = velh / passos;
    var mov_y = velv / passos;



    // Horizontal
    if (place_meeting(x + mov_x, y, obj_colisor))
    {	
		create_part(5,10,10,x,y,velh,velv);
        velh = -velh;
        mov_x = velh / passos;
    
    }


    // Vertical
    if (place_meeting(x, y + mov_y, obj_colisor))
    {
	
		create_part(5,10,10,x,y,velh,velv);
        velv = -velv;
        mov_y = velv / passos;
		pode_dar_dano = true;
    }


    // Move a bola
    x += mov_x;
    y += mov_y;
}
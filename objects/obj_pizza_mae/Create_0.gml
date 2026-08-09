
//sprite que será desenhada
sprite = sprite_index;

//texto debug
estado_txt = "";

//Sprites que vão ser usadas no objeto
sprites = [
			//sprites parado
			[sprite_index]
			
		  ];

//linha do vetor sprites
sprites_index = 0;
//coluna do vetor sprites
face = 0;
//imagem atual da sprite
image_ind = 0;
//velocidade da animaçao
image_spd = 10/ 60;

//quantidade de imagens na sprite
image_numb = sprite_get_number(sprite);
//não precisa existir
troquei = false;

//função para simplificar a troca de sprites
ajusta_sprite = function(_indice_array)
{
	//Checando se a sprite que eu estou usando é a que eu deveria estar usando
	
	if (sprite != sprites[_indice_array][face])
	{
		//acabei de entrar no estado
		//Garantindo que a animação começa do começo
		image_ind = 0;
	}
	
	//Aplicando a sprite correta
	sprite = sprites[_indice_array][face];
	
	//Descobrindo o image number da sprite que eu to usando
	image_numb = sprite_get_number(sprite);
	
	//Aumentando o valor do image_ind com base na image spd
	image_ind += image_spd;
	
	//Zerando a image_ind depois da animação acabar
	image_ind %= image_numb;
}
intervalo_fogo = 4;
timer_fogo = intervalo_fogo;
pizza_de_fogo = function()
{
	if (!global.pizza_de_fogo_ativo) return;

	timer_fogo++;

	if (timer_fogo >= intervalo_fogo)
	{
		timer_fogo = 0;
		var _rastro = instance_create_layer(x,y-6,"Instances",obj_rastro_de_fogo);
		_rastro.image_xscale = 2;
		_rastro.image_yscale = 2;
	
			if (velh != 0)_rastro.image_angle = velh > 0 ? 0 : 180;
			else if (velv != 0)_rastro.image_angle = velv > 0 ? 270 : 90;
	
	}
}
forca_slow = 0.5;
pizza_slow = function()
{
    if (!global.pizza_slow_ativo) return;

    var _inimigo = instance_place(x, y, obj_entidade_inimigo);

    if (_inimigo != noone)
    {
        _inimigo.slow = forca_slow;
		instance_create_layer(x,y,"chao",obj_rastro_de_queijo);
    }
}
pizza_xplode = function()
{
    if (!global.pizza_xplode_ativo) return;

    var _boom = instance_create_layer(x,y,"Instances",obj_effect_anim)
	_boom.sprite_index = spr_explosao_pizza;
	var _dano = instance_create_layer(x,y,"Instances",obj_explode)
	_dano.image_alpha = 0;
	
   
}
pizza_pedacos = function()
{
	 if (!global.pizza_pedaco_ativa) return;
	 var _qtd = irandom_range(1, 4);

    for (var i = 0; i < _qtd; i++)
    {
        var _dir = irandom(359);
        var _pedaco = instance_create_layer(x, y, "Instances", obj_pizza_part);

        _pedaco.velh = lengthdir_x(_pedaco.vel, _dir);
        _pedaco.velv = lengthdir_y(_pedaco.vel, _dir);
        _pedaco.image_angle = _dir;
    }
	
}












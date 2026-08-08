
//sprite que será desenhada
sprite = sprite_index;

//texto debug
estado_txt = "";
estado			= noone;

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
image_spd = 12/ 60;

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
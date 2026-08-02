#region sistema de colisão side-scroll
////Subindo a rampa
////Checando se estou colidindo e se na minha direção em cima esta livre
//for(var i = 1; i <= degrais; i++){
//if (place_meeting(x + velh, y, _obj_colision)) &&
//		(!place_meeting(x + velh, y - i, _obj_colision))
//	{
//		//Posso subir
//		y -= i;
//		break;
//	}
//}

////Descendo a rampa
//for(var i = 1; i <= degrais; i++){
//	if (!place_meeting(x + velh, y, _obj_colision)) &&
//	   (!place_meeting(x + velh, y + i, _obj_colision)) &&
//	   (place_meeting(x + velh, y + i+1, _obj_colision))
//	{
//		//Descendo o numero de pixels do degrau
//		y += i;
//		break;
//	}
//}

//Colisão horizontal
if (place_meeting(x + velh, y, _obj_colision))
{
	//Pegando o sinal da velocidade horizontal
	var _velh = sign(velh)
	//Equanto eu NÃO estiver colidindo na parede no próximo pixel
	//Então eu avanço 1 pixel
	while(!place_meeting(x + _velh, y, _obj_colision))
	{
		//Avanço 1 pixel
		x += _velh;
	}
	//Isso só roda quando o while deixar de quando
	//Vou zerar a minha velh
	velh = 0;
}

x += round(velh);

//Colisão vertical
if (place_meeting(x, y + velv, _obj_colision))
{
	//pegando o sinal da velocidade vertical
	var _velv = sign(velv)
	//Enquanto eu NÃO estiver colisindo na parede no próximo pixel
	//Então eu avanço 1 pixel
	while(!place_meeting(x, y + _velv, _obj_colision))
	{
		//Avanço 1 pixel
		y += _velv;
	}
	//Isso só roda quando o while deixar
	//Vou zerar a minha velv
	velv = 0;
}

y    += round(velv);
//velv += grav;
#endregion
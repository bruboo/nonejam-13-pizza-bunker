//calcula cada passo q a pizza anda 
var passos = ceil(max(abs(velh), abs(velv)));

if (passos < 1)
{
    passos = 1;
}


//colisao da pizza
repeat(passos)
{
    var mov_x = velh / passos;
    var mov_y = velv / passos;



    // Horizontal
    if (place_meeting(x + mov_x, y, obj_colisor))
    {
		ultimo_forno = noone;
		create_part(1,10,15,x,y,velh,velv);
		lista_inimigos = [];
        velh = -velh;
        mov_x = velh / passos;
		pode_dar_dano = true;
    
    }


    // Vertical
    if (place_meeting(x, y + mov_y, obj_colisor))
    {
		ultimo_forno = noone;
		create_part(1,10,15,x,y,velh,velv);
		lista_inimigos = [];
        velv = -velv;
        mov_y = velv / passos;
		pode_dar_dano = true;
    }


    // Move a bola
    x += mov_x;
    y += mov_y;
}
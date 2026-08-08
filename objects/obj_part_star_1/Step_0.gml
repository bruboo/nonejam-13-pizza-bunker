
//usar isso aqui quando quiser sincar o alpha com a vida da particula
//image_alpha = life / life_max;
depth = -y;

life--;



//o ex a cima tbm pode ser feito com um lerp
velh = lerp(velh,0,0.01);
velv = lerp(velv,0,0.01);


if(life <= 0) instance_destroy();

var _progresso = life / life_max;
_progresso = 1 - power(1 - _progresso, 5);

image_xscale = start_scale * _progresso;
image_yscale = start_scale * _progresso;

x += velh;
y += velv;




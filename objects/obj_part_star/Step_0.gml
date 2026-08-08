
//usar isso aqui quando quiser sincar o alpha com a vida da particula
//image_alpha = life / life_max;
depth = -y;

life--;

start_velh = 0;
start_velv = 0;

//multiplicar um valor por um valor menor do q 1 ele diminui(nao csg entender mt bem isso mas seguimos)
//ex: nosso valor é var _part_spd = random_range(1,10); entre 1 e 10, multiplicar algum deles por um valor 
//menor da isso
//velh *= 0.99;
//velv *= 0.99;




//o ex a cima tbm pode ser feito com um lerp
velh = lerp(velh,0,0.01);
velv = lerp(velv,0,0.01);


if(life <= 0) instance_destroy();


x += velh;
y += velv;



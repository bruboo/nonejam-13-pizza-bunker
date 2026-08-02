// Inherit the parent event
event_inherited();
move_speed = 4;

//Setando que eu sou o player
global.player		=  id;
obj_camera.alvo = global.player;

visivel = true;
timer_invencivel = 0;
toma_dano = false;

vida_max = 10
vida = vida_max;

xp = 0;

dano_bonus = 0;
//delay entre os tiros
atk_speed = 60;
timer_tiro = atk_speed;

//resistencia da pizza
res_pizza = 2;


// possiveis upgrades
// dano_bonus = adicionar dano
// move_speed = adicionar velocidade
// atk_speed  = diminuir a espera entre ataques
// res_pizza = faz a pizza quicar mais
// vida_max = adiciona na vida



//Ajustando a orientação do meu listener
audio_listener_orientation(0, 0, 1, 0, -1, 0);
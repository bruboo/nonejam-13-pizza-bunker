// Inherit the parent event
event_inherited();

//Setando que eu sou o player
global.player		=  id;
obj_camera.alvo = global.player;

visivel = true;
timer_invencivel = 0;
toma_dano = false;

vida = 10;

xp = 0;


//delay entre os tiros
timer_tiro = 15;
atk_speed = timer_tiro;

//Ajustando a orientação do meu listener
audio_listener_orientation(0, 0, 1, 0, -1, 0);
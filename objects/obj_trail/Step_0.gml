
//Diminuindo o alpha
image_alpha -= velocidade_alpha;

//Quando zerar, se tornar invisivel, destruir-se
if(image_alpha <= 0) instance_destroy();

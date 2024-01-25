/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
xscale = 1;
velh = 0;
velv = 0;

dead = false;

poise = poise_max;


cria_aviso = function ()
{
	var _aviso = instance_create_depth(x, y, depth, obj_aviso);
	_aviso.pai = id;
}

lida_dano = function(_dano = 1, _poise = 1)
{
	vida -= _dano;
	
	poise = max(poise  - _poise, 0);
	
	
	if(poise <= 0 or estado_atual != estado_attack )
	{
		troca_estado(estado_hurt);
	}
	
	
}


estado_idle = new estado();
estado_walk = new estado();
estado_attack = new estado(); 
estado_hurt = new estado();
estado_death = new estado();
estado_hunt = new estado(); 


inicia_estado(estado_idle);
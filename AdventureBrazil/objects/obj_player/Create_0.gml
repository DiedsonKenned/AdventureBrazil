/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


meu_dano = noone;
dano_poise = 9;

estado_idle = new estado();
estado_walk = new estado();
estado_atack = new estado();


#region estado_idle
estado_idle.inicia = function()
{
	var _sprite = define_sprite (dir, spr_player_side_idle, spr_player_front_idle, spr_player_back_idle);
	sprite_index = _sprite;
	image_index = 0;
}

estado_idle.roda = function()
{
	
	if (up xor down or left xor right)
	{
		troca_estado(estado_walk);
	}
	if(atack)
	{
		troca_estado(estado_atack);
	}
}

#endregion
#region estado_walk
estado_walk.inicia = function()
{
	dir = (point_direction(0, 0, right - left, down - up) div 90);
	
	sprite_index = define_sprite(dir, spr_player_side_corre, spr_player_front_corre, spr_player_back_corre);
	image_index = 0;
}
estado_walk.roda = function()
{
	dir = (point_direction(0, 0, velh, velv) div 90);
	
	if(velh != 0)
	{
		image_xscale = sign(velh);
	}
	
	sprite_index = define_sprite(dir, spr_player_side_corre, spr_player_front_corre, spr_player_back_corre);
	
	velv = (down - up) * vel;
	velh = (right - left) * vel;
	
	if (velh == 0 && velv == 0)
	{
		troca_estado (estado_idle);
	}
	if(atack)
	{
		troca_estado(estado_atack);
	}
}
#endregion
#region estado_atack
estado_atack.inicia = function()
{
	
	sprite_index = define_sprite(dir, spr_player_atack_side, spr_player_atack_front, spr_player_atack_back);
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
    
	var _x = x + lengthdir_x(8, dir * 90);
	var _y = y + lengthdir_y(16, dir * 90);
	
	
	meu_dano = instance_create_depth(_x, _y, depth, obj_dano_player);
	meu_dano.dano_poise = dano_poise;
	
}
estado_atack.roda = function()
{
	if(image_index >= image_number - 0.2)
	{
		troca_estado(estado_idle);
	}
}

estado_atack.finaliza = function()
{
	instance_destroy(meu_dano);
}

#endregion
#region variaveis

up = noone;
down = noone;
left = noone;
right = noone;
atack = noone;

velh = 0;
velv = 0;
vel = 2;

dir = 0;

#endregion

inicia_estado(estado_idle);
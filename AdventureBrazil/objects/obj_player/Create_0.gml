/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
max_vida = 5;
vida = max_vida;
poise_max = 5;
poise = poise_max;
dead = false;


meu_dano = noone;
dano_poise = 9;
score = 0;
imageindex = 0;

estado_idle = new estado();
estado_walk = new estado();
estado_atack = new estado();
estado_hurt = new estado();
estado_death = new estado();

lida_dano = function(_dano = 1, _poise = 1){
	vida -= _dano;
	poise = max(poise - _poise, 0);
	
	if(vida <= 0 && estado_atual != estado_death){
		troca_estado(estado_death);
		return;
	}
	
	if(poise <= 0 or estado_atual != estado_atack){
		troca_estado(estado_hurt);
	}
	
}


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
	if (keyboard_check_released(ord("H"))){
		troca_estado(estado_hurt);
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
#region estado_hurt
estado_hurt.inicia = function(){
	sprite_index=define_sprite(dir, spr_player_hurt_side, spr_player_hurt_front, spr_player_hurt_back);
	image_index = 0;
	
	velh = 0;
	velv = 0;
	
	imageindex = 0;
	obj_screenshake.ang = 5;
	obj_screenshake.valor +=20;
}
estado_hurt.roda = function(){
	if(image_index > imageindex){
		imageindex = image_index;
	}
	if(imageindex > image_index){
		troca_estado(estado_idle);
	}
}
#endregion

#region estado death
estado_death.inicia = function(){
	sprite_index = spr_player_death;
	image_index = 0;
}
estado_death.roda = function(){
	if(image_index > imageindex){
		imageindex = image_index
	}
	if(imageindex > image_index){
		
		image_index = image_number-1;
		
		if(global.game_over == false){
			
			var _cam_x = camera_get_view_x(view_camera[0]);
			var _cam_y = camera_get_view_y(view_camera[0]);
			
			layer_sequence_create("sequencia", _cam_x, _cam_y, sq_morreu);
			global.game_over = true;
		}
	}
	
	
}
estado_death.finaliza = function(){
	
}
#endregion
inicia_estado(estado_idle);
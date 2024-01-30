/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

tempo_estado = game_get_speed(gamespeed_fps)*15;
timer_estado = tempo_estado;

range = 10;
dano = noone;
sprite = 
{
	attack : spr_slime_attack,
	death : spr_slime_death,
	hurt : spr_slime_hurt,
	idle : spr_slime_idle,
	walk : spr_slime_walk
};



destinox = 0;
destinoy = 0;

alvo = noone;

// Inherit the parent event
event_inherited();

#region estado_idle
	estado_idle.inicia = function()
	{
		sprite_index = sprite.idle;
		image_index = 0;
		timer_estado = tempo_estado;
	}
	estado_idle.roda = function()
	{
		timer_estado--;
		
		var _tempo = irandom(timer_estado);
		
		if(_tempo <= tempo_estado * .01)
		{
			var _estado_novo = choose(estado_idle, estado_walk, estado_walk)
			troca_estado(_estado_novo);
		}
	}
#endregion

#region estado_walk
	estado_walk.inicia = function()
	{
		sprite_index = sprite.walk;
		image_index = 0;
		timer_estado = tempo_estado;
		
		destinox = irandom(room_width);
		destinoy = irandom(room_height);
		
		xscale = sign(destinox - x);
	}
	estado_walk.roda = function()
	{
		timer_estado--;
		
		var _tempo = irandom(timer_estado);
		
		if(_tempo <= 5)
		{
			var _estado_novo = choose(estado_idle, estado_walk)
			troca_estado(_estado_novo);
		}
		
		mp_potential_step_object(destinox, destinoy, 1, obj_colisor);
		
	}
#endregion

#region estado_perseguição
	estado_hunt.inicia = function ()
	{
		sprite_index = sprite.walk;
		image_index = 0;
		
		if(instance_exists(obj_player))
		{
			alvo = obj_player.id;
		}
		
		cria_aviso();
		
	}
	estado_hunt.roda = function()
	{
		if(!instance_exists(obj_player))
		{
			alvo = noone;
			troca_estado(estado_idle);
		}
		
		mp_potential_step_object(alvo.x, alvo.y, 1, obj_colisor);
		
		var _dist = point_distance(x, y , alvo.x, alvo.y);
		
		if(_dist <= range)
		{
			troca_estado(estado_attack);
		}
		
		xscale = sign(alvo.x - x);
		
		
		
		var _n = instance_number(object_index);
		
		for (var i = 0; i < _n; i++)
		{
			var _slime = instance_find(object_index, i);
			
			if(_slime == id)
			{
				
			}
			else
			{
				if(_slime.alvo != alvo)
				{
					with(_slime)
					{
						troca_estado(estado_hunt);
					}
				}
			}
		}
		
	}


#endregion

#region estado_ataque
	estado_attack.inicia = function()
	{
		sprite_index = sprite.attack;
		image_index = 0;
	}
	estado_attack.roda = function()
	{
		if(dano == noone && image_index >= 7)
		{
			dano = instance_create_depth(x,y, depht,obj_dano_inimigo);
		}
		
		if(image_index >= image_number - .5)
		{
			troca_estado(estado_idle);
		}
	}
	estado_attack.finaliza = function()
	{
		alvo = noone;
	}


#endregion
	
#region estado_hurt
	estado_hurt.inicia = function()
	{
		sprite_index = sprite.hurt;
		image_index = 0;
		
	
	}
	estado_hurt.roda = function()
	{
		if(image_index >= image_number - .5)
		{
			if(vida > 0)
			{
				troca_estado(estado_hunt);
			}
			else
			{
				troca_estado(estado_death);
			}
		}
	}
	
	estado_hurt.finaliza = function()
	{	
		if (poise < 1)
		{
			poise = poise_max;
		}
	}
	
	
	

#endregion
	
#region estado_morte
	estado_death.inicia = function()
	{
		sprite_index = sprite.death;
		image_index = 0;
	}
	estado_death.roda = function()
	{
		if(image_index >= image_number - .5)
		{
			instance_destroy();
		}
	}

#endregion



inicia_estado(estado_idle);
	
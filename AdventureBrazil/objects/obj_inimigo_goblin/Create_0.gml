/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Inherit the parent event
tempo_estado = game_get_speed(gamespeed_fps)*2;
timer_estado = tempo_estado;

destinox = 0;
destinoy = 0;
alvo = noone;
	
event_inherited();

#region estado_idle
	estado_idle.inicia = function()
	{
		sprite_index = spr_inimigo_idle_front;
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
		sprite_index = spr_inimigo_walk;
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

	estado_hunt.inicia = function()
	{
		sprite_index = spr_inimigo_walk;
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
		
		mp_potential_step_object (alvo.x, alvo.y, 1, obj_colisor);
		
		var _dist = point_distance(x, y , alvo.x, alvo.y);
		
		if(_dist <= 15)
		{
			troca_estado(estado_attack);
		}
		
		xscale = sign(alvo.x - x);
		
		
		
		var _n = instance_number(object_index);
		
		for (var i = 0; i < _n; i++)
		{
			var _goblin = instance_find(object_index, i);
			
			if(_goblin == id)
			{
				
			}
			else
			{
				if(_goblin.alvo != alvo)
				{
					var _disti = point_distance( x, y , _goblin.x, _goblin.y);
					if(_disti < 100)
					{
							with(_goblin)
						{
							troca_estado(estado_hunt);
						}
					}
					
				}
			}
		}
	}


#endregion

#region estado_ataque
	estado_attack.inicia = function()
	{
		sprite_index = spr_inimigo_atack;
		image_index = 0;
	}
	estado_attack.roda = function()
	{
		if(image_index >= image_number * .5)
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
		sprite_index = spr_inimigo_hurt_efc;
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

#endregion
	
	
#region estado_morte
	estado_death.inicia = function()
	{
		sprite_index = spr_inimigo_death;
		image_index = 0;
		
		dead = true;
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
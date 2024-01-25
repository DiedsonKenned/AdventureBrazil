/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region CONTROLES
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);
#endregion

#region MOVIMENTAÇÃO

var _move = key_right - key_left;

hspd = _move * spd;

vspd = vspd + grv;

if (hspd != 0) image_xscale = sign(hspd);

if place_meeting(x+hspd,y,obj_wall){
	while(!place_meeting(x+sign(hspd),y,obj_wall)){
		x = x + sign(hspd);
	}
	hspd = 0;
}
x = x + hspd;


if place_meeting(x,y+vspd,obj_wall){
	while(!place_meeting(x,y+sign(vspd),obj_wall)){
		y = y + sign(vspd);
	}
	vspd = 0;
}
y = y + vspd;

if place_meeting(x,y+1,obj_wall) and key_jump{
	vspd -= 8;
}


#endregion

#region

if (!place_meeting(x,y+1, obj_wall)){
	sprite_index = spr_player_jump_plat;
}
else{
	if(hspd != 0){
		sprite_index = spr_player_right_plat;
	}
}
if hspd = 0{
	if place_meeting(x,y+1, obj_wall){
		sprite_index = spr_player_idle_plat;
	}
}
if hspd != 0{
	if place_meeting(x,y+1,obj_wall){
		sprite_index = spr_player_right_plat;
	}
}

#endregion
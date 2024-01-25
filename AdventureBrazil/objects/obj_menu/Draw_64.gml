/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_set_font(ft_menu);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var x1 = gui_width / 1.5 ;
var y1 = gui_height / 2;
var margin = 55;

var _m_x = device_mouse_x_to_gui(0);
var _m_y = device_mouse_y_to_gui(0);




for(var i = 0; i < op_max; i++)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var y2 = y1 + (margin * i);
	var string_w = string_width(options[i]);
	var string_h = string_height(options[i]);
	
	if(point_in_rectangle(_m_x, _m_y, x1 - string_w / 2, y2 - string_h / 2, x1 + string_w / 2, y2 + string_h / 2)){
		draw_set_color(c_green);
		index = i;
		if(mouse_check_button_pressed(mb_left)){
			if(index == 1){
				room_goto_next();
			}
			if(index == 3){
				game_end();
			}
		}
	}else{
		draw_set_color(c_white);
	}
	
	
	draw_text(x1,y2,options[i]);
}
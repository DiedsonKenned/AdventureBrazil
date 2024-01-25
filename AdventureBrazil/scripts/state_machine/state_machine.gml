// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function estado() constructor
{	
	static inicia = function() {};
	static roda = function() {};
	static finaliza = function() {};
}

function inicia_estado(_estado)
{
	estado_atual = _estado;
	
	estado_atual.inicia();
}

function roda_estado()
{
	estado_atual.roda();
}

function troca_estado(_estado)
{
	estado_atual.finaliza();
	estado_atual = _estado;
	estado_atual.inicia();
}	


function define_sprite (_dir = 0, _sprite_side, _sprite_front, _sprite_back)
{
	var _sprite;
	
	switch(_dir)
	{
		case 0: _sprite = _sprite_side; break;
		case 1: _sprite = _sprite_back; break;
		case 2: _sprite = _sprite_side; break;
		case 3: _sprite = _sprite_front; break;
	}
	
	return _sprite;
}
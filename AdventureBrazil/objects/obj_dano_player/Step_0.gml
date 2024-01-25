/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _lista = ds_list_create();

var _qtd = instance_place_list(x, y, obj_inimigo_pai, _lista, false);

for (var _i = 0; _i < ds_list_size(_lista); _i++)
{
		var _atual = _lista [| _i];
		var _existe = array_contains(lista_inimigos, _atual);
		
		if(!_existe)
		{
			array_push(lista_inimigos, _atual);
			with(_atual)
			{
				if(!dead)
				{
					lida_dano(, other.dano_poise);
				}
			}
		}
}

ds_list_destroy(_lista);
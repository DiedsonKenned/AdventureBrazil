/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (keyboard_check_pressed(ord("E"))) {
    if (!interacted) {
		cria_aviso = function ()
	{
		var _aviso = instance_create_depth(x, y, depth, obj_aviso_interacao);
		_aviso.pai = id;
	}
        questionIndex = irandom(array_length_1d(questionList) - 1);
        show_message(questionList[questionIndex][0]);
    } else {
        show_message("Você já interagiu com este NPC.");
    }
}



/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var player = instance_nearest(x, y, obj_player); // Substitua "obj_player" pelo nome do objeto do jogador

if (player != noone && point_distance(x, y, player.x, player.y) <= interactionDistance) {
    if (!interacted && current_time - lastInteractionTime >= 100 * room_speed) {
        questionIndex = irandom(array_length_1d(questionList) - 1);
        show_message(questionList[questionIndex][0]);

        var userAnswer = get_string("Sua resposta:","");
        if (string_lower(userAnswer) == string_lower(questionList[questionIndex][1])) {
            show_message("Resposta correta!");
            interacted = true;
			score += 1;
        } else {
            show_message("Resposta incorreta. Este NPC ficará bloqueado por 60 segundos.");
            lastInteractionTime = current_time;
			score -= 1;
        }
		if(score <= 0){
			score = 0;
		}
    } else if(current_time - lastInteractionTime < 100 * room_speed) {
        show_message("Este NPC está bloqueado. Espere 100 segundos para tentar novamente.");
    }
}



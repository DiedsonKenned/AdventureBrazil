/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (keyboard_check_pressed(ord("E"))) {
    if (!interacted) {
        questionIndex = irandom(array_length_1d(questionList) - 1);
        show_message(questionList[questionIndex][0]);
    } else {
        show_message("Você já interagiu com este NPC.");
    }
}



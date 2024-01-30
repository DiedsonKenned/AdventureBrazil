/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_set_font(ft_menu);
draw_set_color(c_blue)
draw_text(50, 20, "Pontos: " + string(score));
draw_text(50,45, "Vida: " + string(obj_player.vida));
draw_text(50,65, "Poise: " + string(obj_player.poise));
if (score >= 6) {
    show_message("Parabéns! Você avançou para a próxima fase!");
    // Adicione aqui o código para transição de fase, como mudar de sala
    room_goto_next(); // Isso assume que você está usando salas no Game Maker
	score = 0; // Reinicia a pontuação para a próxima fase, ajuste conforme necessário
}
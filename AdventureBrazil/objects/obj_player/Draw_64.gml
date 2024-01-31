draw_set_font(ft_menu);
draw_set_color(c_white);
draw_text(50,20, "Pontos: " + string(score));
draw_text(38,45, "Vida: " + string(obj_player.vida));
if (score >= 6) {
    show_message("Parabéns! Você avançou para a próxima fase!");
    // Adicione aqui o código para transição de fase, como mudar de sala
    game_end(); // Isso assume que você está usando salas no Game Maker
	score = 0; // Reinicia a pontuação para a próxima fase, ajuste conforme necessário
}
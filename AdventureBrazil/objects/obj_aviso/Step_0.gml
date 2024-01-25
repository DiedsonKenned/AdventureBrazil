/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!pai) instance_destroy();

if(!instance_exists(pai)) instance_destroy();

x = pai.x;
y = pai.bbox_top;

image_alpha -= 0.02;

if (image_alpha <= 0) instance_destroy();


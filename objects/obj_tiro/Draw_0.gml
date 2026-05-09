draw_self();


 
//muda o processamento de cores
gpu_set_blendmode(bm_add);
//sobrepondo o tiro com uma versao dele mesmo de cor diferente para gerar iluminação
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale *1.5, image_yscale * 1.5, image_angle, rainbow, 0.5)

gpu_set_blendmode(bm_normal);
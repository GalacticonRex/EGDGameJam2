draw_set_font(global.fontSmall);
var len = string_width(global.help_tag);
draw_text_colour((room_width/2-len/2), 16, global.help_tag, c_white,c_white,c_white,c_white, global.help_tag_alpha);
global.help_tag_alpha = global.help_tag_alpha_multiplier * (-cos(global.help_tag_time / 800) + 1)/2;
global.help_tag_alpha_multiplier += (1-global.help_tag_alpha_multiplier) / 120;
global.help_tag_time += delta_time / 1000;

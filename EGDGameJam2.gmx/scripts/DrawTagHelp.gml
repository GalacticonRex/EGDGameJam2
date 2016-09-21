draw_set_font(global.fontSmall);
var len = string_width(global.help_tag);
draw_text_colour((room_width/2-len/2), 16, global.help_tag, c_white,c_white,c_white,c_white, global.help_tag_alpha);
global.help_tag_alpha = (sin(current_time / 800) + 1)/2;

var ret = false;
var active = argument0;

var boxx = room_width - (sprite_get_width(phone_spr) + sprite_get_width(chat_bubble)) / 2 - 28 + sprite_get_xoffset(chat_bubble);
var boxy = room_height - (sprite_get_height(phone_spr) + sprite_get_height(chat_bubble)) / 2 + 32 + sprite_get_yoffset(chat_bubble);

var x0 = boxx + MARGIN - sprite_get_xoffset(chat_bubble);
var y0 = boxy + MARGIN - sprite_get_yoffset(chat_bubble);
var x1 = x0 + sprite_get_width(chat_bubble)-MARGIN*2;
var y1 = y0 + sprite_get_height(chat_bubble)-MARGIN*2;

if ( mouse_x >= x0 and mouse_x < x1 and mouse_y >= y0 and mouse_y < y1 ) {
    if( mouse_check_button(mb_left) or mouse_check_button_released(mb_left) )
        draw_sprite_ext(chat_bubble_hightlight, 0, boxx, boxy,1.05,1.05,0,c_white,global.game_alpha);
    else
        draw_sprite_ext(chat_bubble, 0, boxx, boxy,1.05,1.05,0,c_white,global.game_alpha);
    ret = mouse_check_button_released(mb_left);
} else {
    draw_sprite_ext(chat_bubble, 0, boxx, boxy,1,1,0,c_white,global.game_alpha);
}

draw_set_colour(c_white);
draw_text_ext(x0+8, y0+8, global.option_phone, BLOCK_SIZE, sprite_get_width(chat_bubble)-MARGIN*2-16);

return ret;


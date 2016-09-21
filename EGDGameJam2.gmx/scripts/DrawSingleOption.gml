var retvalue = false;
var option = argument0;
var index = argument1
var type = argument2;
var active = argument3;

var sx;
if( type == PHONE_OPTION )
    sx = room_width / 2 + BORDER+16;
else
    sx = BORDER+16

var ex;
if( type == MENTAL_OPTION_HALF )
    ex = room_width - sprite_get_width(phone_spr) - BORDER;
else
    ex = room_width - BORDER - 16;

var sy = room_height-OPTION_WINDOW + index*(BLOCK_SIZE + OPTION_SPACE*2) + (MARGIN-OPTION_SPACE);
var ey = sy + (BLOCK_SIZE+OPTION_SPACE*2);

draw_set_colour(c_black);
if( active and mouse_x >= sx and mouse_x < ex and mouse_y-OPTION_SPACE >= sy and mouse_y-OPTION_SPACE < ey ) {
    if( mouse_check_button_released(mb_left) ) {
        audio_play_sound(Click,3,false);
        retvalue = true;
    }
    if( mouse_check_button(mb_left) )
        draw_set_colour(c_black);
    else
        draw_set_colour(c_gray);
    
    draw_roundrect(sx,sy,ex,ey,false);
    if( mouse_check_button_released(mb_left) or mouse_check_button(mb_left) )
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
}
draw_text(sx+OPTION_SPACE, sy+OPTION_SPACE, option);

return retvalue;

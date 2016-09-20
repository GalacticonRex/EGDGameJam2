var retvalue = false;
var option = argument0;
var index = argument1
var type = argument2;
var active = argument3;

draw_set_colour(c_black);

var sx;
if( type == PHONE_OPTION )
    sx = room_width / 2 + MARGIN*3;
else
    sx = MARGIN*3

var ex;
if( type == MENTAL_OPTION_HALF )
    ex = room_width / 2 - MARGIN*3;
else
    ex = room_width - MARGIN*3;

var sy = room_height-OPTION_WINDOW + index*(BLOCK_SIZE + OPTION_SPACE*2) + (MARGIN-OPTION_SPACE);
var ey = sy + (BLOCK_SIZE+OPTION_SPACE*2);

if( active and mouse_x >= sx and mouse_x < ex and mouse_y-OPTION_SPACE >= sy and mouse_y-OPTION_SPACE < ey ) {
    if( mouse_check_button(mb_left) ) {
        draw_set_colour(c_aqua);
        retvalue = true;
    }
    draw_roundrect(sx,sy,ex,ey,false);
    if( mouse_check_button(mb_left) )
        draw_set_colour(c_navy);
    else
        draw_set_colour(c_white);
}
draw_text(sx+OPTION_SPACE, sy+OPTION_SPACE, option);

return retvalue;

var retvalue = false;
var option = argument0;
var index = argument1
var type = argument2;
var active = argument3;

draw_set_colour(c_black);

var sx;
if( type == PHONE_OPTION )
    sx = room_width / 2 + MARGIN;
else
    sx = MARGIN*2

var ex;
if( type == MENTAL_OPTION_HALF )
    ex = room_width / 2 - MARGIN*2;
else
    ex = room_width - MARGIN*2;

var sy = room_height-OPTION_WINDOW + index*(BLOCK_SIZE + MARGIN*2);
var ey = sy + (BLOCK_SIZE+MARGIN*2);

if( active and mouse_x >= sx and mouse_x < ex and mouse_y-MARGIN >= sy and mouse_y-MARGIN < ey ) {
    if( mouse_check_button(mb_left) ) {
        draw_set_colour(c_aqua);
        retvalue = true;
    }
    draw_rectangle(sx,sy,ex,ey,false);
    if( mouse_check_button(mb_left) )
        draw_set_colour(c_black);
    else
        draw_set_colour(c_white);
}
draw_text(sx+MARGIN, sy+MARGIN, option);

return retvalue;

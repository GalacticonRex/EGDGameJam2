var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var txt = argument4;

var moused = (mouse_x>=x1 and mouse_x<x2 and mouse_y>=y1 and mouse_y<y2);

if( moused and (mouse_check_button(mb_left) or mouse_check_button_released(mb_left))) {
    draw_set_colour(c_aqua);
    draw_roundrect(x1,y1,x2,y2,false);
    draw_set_colour(c_black);
} else if ( moused ) {
    draw_set_colour(c_gray);
    draw_roundrect(x1,y1,x2,y2,false);
    draw_set_colour(c_black);
} else {
    draw_set_colour(c_white);
    draw_roundrect(x1,y1,x2,y2,false);
    draw_set_colour(c_black);
}
var spanx = string_width(txt);
var spany = string_height(txt);
draw_text((x2-spanx+x1)/2,(y2-spany+y1)/2,txt);

return ( moused and mouse_check_button_released(mb_left) );

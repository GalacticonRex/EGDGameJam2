var text = argument0;
var count = argument1;
var data = argument2;
var do_something = argument3;

var retvalue = -1;
var margin = 8;
var fullwindow = 240;
var subwindow = fullwindow - 40;

if ( count == 0 ) {

    draw_set_colour(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(8, room_height-fullwindow, room_width-16, room_height-32, false);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text_ext(8+margin, room_height-fullwindow+margin, text, 20, room_width-16-margin*2);

} else {
    var blocksz = (20+margin*2);
    
    draw_set_colour(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(8, room_height-fullwindow, room_width-8, room_height - subwindow - 8, false);
    if( !is_undefined(global.option_phone) )
        draw_rectangle(8, room_height-subwindow, room_width / 2 - 8, room_height - 32, false);
    else
        draw_rectangle(8, room_height-subwindow, room_width - 8, room_height - 32, false);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text_ext(8+margin, room_height-fullwindow+margin, text, 20, room_width-16-margin*2);
    
    for (var i=0;i<count;i+=1) {
        var sx = 16;
        var sy = room_height-subwindow+i*blocksz;
        var ex;
        if( !is_undefined(global.option_phone) )
            ex = room_width / 2 - 16;
        else
            ex = room_width - 16;
        var ey = sy + blocksz;
        
        draw_set_colour(c_black);
        
        if( do_something and mouse_x >= sx and mouse_x < ex and mouse_y >= sy and mouse_y < ey ) {
            if( mouse_check_button(mb_left) ) {
                draw_set_colour(c_aqua);
                retvalue = i;
            }
            draw_rectangle(sx,sy,ex,ey,false);
            if( mouse_check_button(mb_left) )
                draw_set_colour(c_black);
            else
                draw_set_colour(c_white);
        }
            
        draw_text(sx+margin, sy+margin, data[i]);
    }
    if( !is_undefined(global.option_phone) ) {
        draw_set_colour(c_black);
        var sx = room_width / 2 + 8;
        var sy = room_height-subwindow;
        var ex = room_width - 16;
        var ey = sy + blocksz;
        if( do_something and mouse_x >= sx and mouse_x < ex and mouse_y >= sy and mouse_y < ey ) {
            if( mouse_check_button(mb_left) ) {
                draw_set_colour(c_aqua);
                retvalue = "Phone";
            }
            draw_rectangle(sx,sy,ex,ey,false);
            if( mouse_check_button(mb_left) )
                draw_set_colour(c_black);
            else
                draw_set_colour(c_white);
        }
        draw_text(sx+margin, sy+margin, global.option_phone);
    }
}    
return retvalue;

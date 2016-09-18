draw_set_color(c_black);
draw_set_alpha(global.in_game_menu_alpha);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);

if( DrawButton(room_width/3,room_height/4,2*room_width/3,room_height/2-8,"Resume") ) {
    
    global.in_game_menu = false;
    
}
if( DrawButton(room_width/3,room_height/2+8,2*room_width/3,3*room_height/4,"Quit") ) {

    room_goto_previous();

}

global.in_game_menu_alpha = global.in_game_menu_alpha + 0.025;

draw_set_font(TitleFont);
draw_set_colour(c_white);
draw_text(16,16,"This is the game.");

draw_set_font(GameFont);
draw_set_colour(c_black);
if( DrawButton(room_width/2-64,room_height/2 - 136,room_width/2+64, room_height/2 - 4,"Play") ) {
    room_goto_next();
}
if ( DrawButton(room_width/2-64,room_height/2 + 4,room_width/2+64, room_height/2 + 136,"Quit") ) {
    game_end();
}

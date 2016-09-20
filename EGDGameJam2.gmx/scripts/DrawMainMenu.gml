draw_set_font(GameFont);
draw_set_colour(c_black);
draw_text(16,16,"This is the game.");

if( DrawButton(16,100,room_width-16,200,"Play") ) {
    room_goto_next();
}

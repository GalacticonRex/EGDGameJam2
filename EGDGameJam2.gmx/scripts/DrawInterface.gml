draw_set_font(GameFont);

if ( keyboard_check_pressed(vk_escape) ) {
    global.in_game_menu_alpha = 0;
    global.in_game_menu = !global.in_game_menu;
}

selected = DrawOptions(global.rtext, global.count, global.options, !global.in_game_menu);

if( global.count != 0 ) {
    if( selected == "Phone" ) {
        global.script_index = global.labeljump_phone;
        ParseOption();
    } else if( selected != -1 ) {
        global.script_index = global.labeljump[selected];
        ParseOption();
    }
} else if( keyboard_check_pressed(vk_space) ) {
    if( !ParseOption() ) {
        show_debug_message("END OF DAYS");
        room_goto_previous();
    }
}

if( global.in_game_menu )
    DrawGameMenu();
else if( DrawButton(8,8,40,40,"...") ) {
    global.in_game_menu_alpha = 0;
    global.in_game_menu = true;
}

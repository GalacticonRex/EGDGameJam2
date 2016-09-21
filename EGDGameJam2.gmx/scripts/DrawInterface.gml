if( global.return_to_main_menu ) {
    global.game_alpha -= 0.05;
    if( global.game_alpha <= 0 )
        room_goto_previous();
}
else {
    global.game_alpha += (1-global.game_alpha) / 20;
}

draw_set_font(global.fontSmall);
selected = DrawOptions(global.rtext, global.count, global.options, !global.in_game_menu);

if( !global.return_to_main_menu ) {
    if ( keyboard_check_pressed(vk_escape) ) {
        global.in_game_menu_alpha = 0;
        global.in_game_menu = !global.in_game_menu;
    }

    if( global.count != 0 ) {
        global.help_tag = "Select an option to continue...";
        if( selected == "Phone" ) {
            global.help_tag_time = 0;
            global.script_index = global.labeljump_phone;
            ParseOption();
        } else if( selected != -1 ) {
            global.help_tag_time = 0;
            global.script_index = global.labeljump[selected];
            ParseOption();
        }
    } else {
        global.help_tag = "Press [SPACEBAR] to proceed...";
        if( keyboard_check_pressed(vk_space) ) {
            global.help_tag_time = 0;
            if( !ParseOption() ) {
                global.return_to_main_menu = true;
                return 0;
            }
        }
    }

    if( global.in_game_menu ) {
        global.help_tag_alpha = 0;
        DrawGameMenu();
    } else {
        var menu = DrawButton(8,8,40,40,"...",true);
        if( menu == BUTTON_CLICKED ) {
            global.in_game_menu_alpha = 0;
            global.in_game_menu = true;
        }
    }
}

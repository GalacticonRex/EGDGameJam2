if ( global.menu_target_text != global.menu_real_text[global.menu_selected] ) {
    global.menu_target_alpha = global.menu_selected;
    global.menu_selected = 1 - global.menu_selected;
    global.menu_real_text[global.menu_selected] = global.menu_target_text;
}
if ( global.menu_real_alpha != global.menu_target_alpha ) {
    var dif = global.menu_target_alpha - global.menu_real_alpha;
    var direc = dif / abs(dif)
    global.menu_real_alpha += dif / global.text_shift_speed;
    if( abs(global.menu_real_alpha - global.menu_target_alpha) < 0.01 ) {
        global.trigger = true;
    }
}

draw_set_font(global.fontHuge);
draw_set_colour(c_white);
draw_set_alpha(global.menu_alpha);
draw_text(16,16,"This is the game.");

draw_set_font(global.fontLarge);
draw_set_colour(c_black);

var still_on_menu = not global.go_to_play and not global.go_to_quit;
var play = DrawButton(room_width/4,room_height/2 - 96,3*room_width/4, room_height/2,"Play", still_on_menu);
var quit = DrawButton(room_width/4,room_height/2,3*room_width/4, room_height/2 + 96,"Quit", still_on_menu);

if ( global.go_to_play ) {

    if( keyboard_check_pressed(vk_space) ) {
        global.help_tag_time = 0;
        room_goto_next();
        return 0;
    }

    if ( global.trigger ) {
        global.menu_offset[1-global.menu_selected] += 25 * global.monologue_index;
        global.monologue_index += 1;
        if( global.monologue_index+1 == array_length_1d(global.monologue_play) ) {
            global.text_shift_speed = 20;
        } else if( global.monologue_index == array_length_1d(global.monologue_play) ) {
            global.help_tag_time = 0;
            room_goto_next();
            return 0;
        }
        global.menu_target_text = global.monologue_play[global.monologue_index];
        global.trigger = false;
    }
    global.menu_alpha = global.menu_alpha * 0.6;

} else if ( global.go_to_quit ) {

    if( keyboard_check_pressed(vk_space) )
        game_end();
        
    if ( global.trigger ) {
        global.menu_offset[1-global.menu_selected] += 25 * global.monologue_index;
        global.monologue_index += 1;
        if( global.monologue_index+1 == array_length_1d(global.monologue_quit) ) {
            global.text_shift_speed = 20;
        } else if( global.monologue_index == array_length_1d(global.monologue_quit) ) {
            game_end();
            return 0;
        }
        global.menu_target_text = global.monologue_quit[global.monologue_index];
        global.trigger = false;
    }
    
    global.menu_alpha = global.menu_alpha * 0.6;
    
} else {
    
    global.menu_target_text = "What can I accomplish with this device?";
    
    if( play == BUTTON_CLICKED ) {
        
        global.help_tag = "Press [SPACEBAR] to skip";
        global.help_tag_time = 0;
        
        global.menu_target_text = global.monologue_play[global.monologue_index];
        global.text_shift_speed = 10;
        global.go_to_play = true;
        
    } else if ( play == BUTTON_ABOUT_TO_CLICK or play == BUTTON_HOVER ) {   
        global.menu_target_text = "Can I truly be happy? Or am I destined for a false happiness?"
    }
    if ( quit == BUTTON_CLICKED ) {
        global.help_tag = "";
        global.help_tag_time = 0;
        
        global.menu_target_text = global.monologue_quit[global.monologue_index];
        global.text_shift_speed = 20;
        global.go_to_quit = true;
    } else if ( quit == BUTTON_ABOUT_TO_CLICK or quit == BUTTON_HOVER ) {
        global.menu_target_text = "Perhaps it is hopeless after all..."
    }

}

draw_set_colour(c_white);
draw_set_alpha(global.menu_real_alpha);
draw_text(16, room_height - global.menu_offset[0], global.menu_real_text[0]);

var menu_len = string_width(global.menu_real_text[1]);
draw_set_alpha(1 - global.menu_real_alpha);
draw_text(room_width - menu_len - 16, room_height - global.menu_offset[1], global.menu_real_text[1]);

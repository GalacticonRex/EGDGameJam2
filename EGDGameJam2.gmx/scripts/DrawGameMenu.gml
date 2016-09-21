draw_set_color(c_black);
draw_set_alpha(global.in_game_menu_alpha);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(global.game_alpha);

var resume = DrawButton(room_width/3,room_height/4,2*room_width/3,room_height/2-8,"Resume", true);
var quit = DrawButton(room_width/3,room_height/2+8,2*room_width/3,3*room_height/4,"Quit", true);
if( resume == BUTTON_CLICKED ) {
    
    global.in_game_menu = false;
    
}
if( quit == BUTTON_CLICKED ) {

    audio_sound_gain(global.current_music, 0, 3000);
    room_goto_previous();

}

global.in_game_menu_alpha = global.in_game_menu_alpha + 0.025;

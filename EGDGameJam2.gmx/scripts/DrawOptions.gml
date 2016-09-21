var text = argument0;
var count = argument1;
var data = argument2;
var do_something = argument3;

var retvalue = -1;

if( string_length(global.narrator) != 0 ) {
    var x1 = BORDER*3;
    var x2 = room_width / 2 - BORDER*3;
    var y1 = room_height-TEXT_WINDOW-(BLOCK_SIZE+MARGIN*2);
    var y2 = room_height-TEXT_WINDOW - 8;
    DrawTextbox(x1, y1, x2, y2, personBox);
    
    draw_set_colour(c_navy);
    draw_set_alpha(global.game_alpha);
    draw_set_font(global.fontLarge);
    var w = string_width(global.narrator);
    var h = string_height(global.narrator);
    draw_text((x1-w+x2)/2, (y1-h+y2)/2, global.narrator);
    draw_set_font(global.fontSmall);
}

if ( count == 0 ) {

    var y1 = room_height-TEXT_WINDOW;
    var y2 = room_height - 32;
    DrawTextbox(BORDER, y1, room_width-BORDER, y2, textBox);
    
    draw_set_colour(c_navy);    
    draw_set_alpha(global.game_alpha);
    var h = max(string_height(text), TEXT_WINDOW * 0.75);
    if( global.trigger_phone )
        draw_text_ext(BORDER+16, (y2-h+y1)/2, text, BLOCK_SIZE, room_width-sprite_get_width(phone_spr)-BORDER*2-32);
    else
        draw_text_ext(BORDER+16, (y2-h+y1)/2, text, BLOCK_SIZE, room_width-BORDER*2-32);

} else {
    var phone_available = !is_undefined(global.labeljump_phone);
    show_debug_message("PHONE: " + string(phone_available));
    
    var y1 = room_height - TEXT_WINDOW;
    var y2 = room_height - OPTION_WINDOW - 8;
    
    DrawTextbox(BORDER, y1, room_width - BORDER, y2, textBox);
    DrawTextbox(BORDER, room_height-OPTION_WINDOW, room_width - BORDER, room_height - 32, textBox);
    
    if( phone_available ) {
        var spanx = room_width - sprite_get_width(phone_spr) - 32;        
        draw_sprite(phone_spr, 0, spanx, room_height - sprite_get_height(phone_spr));
    }
    
    draw_set_colour(c_navy);
    draw_set_alpha(global.game_alpha);
    var h = string_height(text);
    if( global.trigger_phone or phone_available )
        draw_text_ext(BORDER+16, (y2-h+y1)/2, text, BLOCK_SIZE, room_width-32-sprite_get_width(phone_spr)-BORDER);
    else
        draw_text_ext(BORDER+16, (y2-h+y1)/2, text, BLOCK_SIZE, room_width-16-MARGIN*2);
    
    if ( phone_available ) {
        for (var i=0;i<count;i+=1)
            if( DrawSingleOption(data[i], i, MENTAL_OPTION_HALF, do_something) )
                retvalue = i;
        if( DrawPhone( do_something ) )
            retvalue = "Phone";
    } else {
        for (var i=0;i<count;i+=1)
            if( DrawSingleOption(data[i], i, MENTAL_OPTION, do_something) )
                retvalue = i;
    }
}

if( global.trigger_phone ) {
    var spanx = room_width - sprite_get_width(phone_spr) - 32;        
    draw_sprite(phone_spr, 0, spanx, room_height - sprite_get_height(phone_spr));
    DrawPhone( false );
}
    
return retvalue;

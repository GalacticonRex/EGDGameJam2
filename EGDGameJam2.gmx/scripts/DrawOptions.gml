var text = argument0;
var count = argument1;
var data = argument2;
var do_something = argument3;

var retvalue = -1;

if( string_length(global.narrator) != 0 ) {
    draw_set_colour(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(8, room_height-TEXT_WINDOW-(BLOCK_SIZE+MARGIN*3), room_width / 2, room_height-TEXT_WINDOW - 8, false);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_set_font(NarratorFont);
    draw_text(16, room_height-TEXT_WINDOW-(BLOCK_SIZE+MARGIN*3), global.narrator);
    draw_set_font(GameFont);
}

if ( count == 0 ) {

    draw_set_colour(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(8, room_height-TEXT_WINDOW, room_width-16, room_height-32, false);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text_ext(8+MARGIN, room_height-TEXT_WINDOW+MARGIN, text, BLOCK_SIZE, room_width-16-MARGIN*2);

} else {
    var phone_available = !is_undefined(global.option_phone);
    
    draw_set_colour(c_white);
    draw_set_alpha(0.5);
    draw_rectangle(8, room_height-TEXT_WINDOW, room_width-8, room_height - OPTION_WINDOW - 8, false);
    if( !is_undefined(global.option_phone) )
        draw_rectangle(8, room_height-OPTION_WINDOW, room_width / 2 - 8, room_height - 32, false);
    else
        draw_rectangle(8, room_height-OPTION_WINDOW, room_width - 8, room_height - 32, false);
    
    draw_set_colour(c_black);
    draw_set_alpha(1);
    draw_text_ext(8+MARGIN, room_height-TEXT_WINDOW+MARGIN, text, BLOCK_SIZE, room_width-16-MARGIN*2);
    
    if ( phone_available ) {
        for (var i=0;i<count;i+=1)
            if( DrawSingleOption(data[i], i, MENTAL_OPTION_HALF, do_something) )
                retvalue = i;
        if( phone_available and DrawSingleOption(global.option_phone, 0, PHONE_OPTION, do_something) )
            retvalue = "Phone";
    } else {
        for (var i=0;i<count;i+=1)
            if( DrawSingleOption(data[i], i, MENTAL_OPTION, do_something) )
                retvalue = i;
    }
}    
return retvalue;

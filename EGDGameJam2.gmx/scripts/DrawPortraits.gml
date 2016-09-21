var len = array_length_1d(global.portrait_sprite);
for( var i=0;i<len;i+=1 ) {
    var alpha = global.portrait_real_alpha[i];
    var target = global.portrait_alpha[i];
    if( alpha != target ) {
        global.portrait_real_alpha[i] += (target - alpha)/4;
        alpha = global.portrait_real_alpha[i];
    }
    var targpos = global.portrait_real_position[i];
    var position = global.portrait_position[i];
    if( targpos != position )
        global.portrait_real_position[i] += (position - targpos)/8;
        
    if( alpha != 0 ) {
        var sprite = global.portrait_sprite[i];
        var posit = global.portrait_real_position[i];
        draw_sprite_ext(sprite, 0, room_width * posit, room_height, 1,1, 0, c_white, alpha*global.game_alpha);
    }
}

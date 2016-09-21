var showing = -1;
var len = array_length_1d(global.background_sprite);
for( var i=0;i<len;i+=1 ) {
    var target = global.background_alphas[i];
    var alpha = global.background_real_alphas[i];
    if ( target == 1 )
        showing = i;
}
show_debug_message(string(showing));
for( var i=0;i<len;i+=1 ) {
    var target = global.background_alphas[i];
    var alpha = global.background_real_alphas[i];
    if( showing != i or ( showing == -1 and alpha != target ) ) {
        global.background_real_alphas[i] += (target - alpha)/4;
        alpha = global.background_real_alphas[i];
    }
    if( alpha != 0 ) {
        var sprite = global.background_sprite[i];
        draw_sprite_ext(sprite, 0, 0, 0, 1,1, 0, c_white, alpha*global.game_alpha);
    }
}
if ( showing != -1 ) {
    var target = global.background_alphas[showing];
    var alpha = global.background_real_alphas[showing];
    if( alpha != target ) {
        global.background_real_alphas[showing] += (target - alpha)/4;
        alpha = global.background_real_alphas[showing];
    }
    var sprite = global.background_sprite[showing];
    draw_sprite_ext(sprite, 0, 0, 0, 1,1, 0, c_white, alpha*global.game_alpha);
}

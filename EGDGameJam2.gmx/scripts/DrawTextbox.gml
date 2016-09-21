var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var spr = argument4

var w = sprite_get_bbox_right(spr) - sprite_get_bbox_left(spr);
var h = sprite_get_bbox_bottom(spr) - sprite_get_bbox_top(spr);

draw_sprite_ext(spr, 0, x1, y1, (x2-x1)/w, (y2-y1)/h, 0, c_white, global.game_alpha);

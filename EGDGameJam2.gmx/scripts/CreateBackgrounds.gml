global.backgrounds = ds_map_create();
ds_map_add( global.backgrounds, "Bedroom", 0 );
ds_map_add( global.backgrounds, "LivingRoom", 1 );
ds_map_add( global.backgrounds, "Cafe", 2 );

global.background_sprite[0] = Bedroom;
global.background_sprite[1] = LivingRoom;
global.background_sprite[2] = Cafe;

for (var i=0;i<array_length_1d(global.background_sprite);i+=1) {
    global.background_alphas[i] = 0;
    global.background_real_alphas[i] = 0;
}

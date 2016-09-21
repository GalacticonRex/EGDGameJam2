global.portraits = ds_map_create();
ds_map_add( global.portraits, "Dillon", 0);
ds_map_add( global.portraits, "Cliff", 1);
ds_map_add( global.portraits, "Helen", 2);
ds_map_add( global.portraits, "Laura", 3);
ds_map_add( global.portraits, "Ricky", 4);

global.portrait_sprite[0] = Dillon;
global.portrait_sprite[1] = Cliff;
global.portrait_sprite[2] = Helen;
global.portrait_sprite[3] = Laura;
global.portrait_sprite[4] = Ricky;

for (var i=0;i<array_length_1d(global.portrait_sprite);i+=1) {
    global.portrait_position[i] = 0.5;
    global.portrait_alpha[i] = 0;
    global.portrait_real_alpha[i] = 0;
}

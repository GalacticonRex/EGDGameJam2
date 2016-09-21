var index = argument0;
for (var i=0;i<array_length_1d(global.background_alphas);i+=1 ) {
    if ( i == index ) {
        global.background_alphas[i] = 1;
    } else {
        global.background_alphas[i] = 0;
    }
}

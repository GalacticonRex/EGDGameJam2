var input = argument0;
var populate;
var i = 0;
var start = 1;
var index = 1;
var in_special = false;
var strl = string_length(input);

while ( index <= strl ) {
    var char = string_char_at(input, index);
    var cspec = string_char_special(char);
    if( char == ' ' or (cspec and not in_special) or in_special ) {
        var temp = string_copy(input, start, index - start);
        if( char == ' ' )
            start = index+1;
        else
            start = index;
        if ( string_length(temp) != 0 ) {
            populate[i] = temp;
            i += 1;
        }
    }
    in_special = cspec;
    index += 1;
}
var temp = string_copy(input, start, index - start);
if ( string_length(temp) != 0 )
    populate[i] = temp;
    
return populate;

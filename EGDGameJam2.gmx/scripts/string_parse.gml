var input = argument0;

var index = 1;
var strl = string_length(input);
while( index < strl and string_char_at(input, index) != ' ' )
    index += 1;

var split;
if( index >= strl ) {
    split[0] = input;
    split[1] = "";
} else {
    split[0] = string_copy(input, 1, index-1);
    split[1] = string_copy(input, index+1, string_length(input));
}

return split;

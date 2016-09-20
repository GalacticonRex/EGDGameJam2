var str = argument0;
var len = string_length(str)
var index = 1;
while ( index <= len and (
        string_byte_at(str, index) == 9 or
        string_byte_at(str, index) == 32 ) ) {
    index += 1
}
var start = index;
index = string_length(str);
while ( index > 0 and string_char_at(str, index) == ' ' ) {
    index -= 1
}
return string_copy(str, start, index - start + 1);

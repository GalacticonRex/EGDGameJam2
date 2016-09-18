if ( global.script_index >= global.script_max_index )
    return false;
    
var ret = true;

var input = global.script[global.script_index];
var strl = string_length(input);
var first = string_char_at(input, 1);

var option;
var data;

var index = 0;
while( index < strl and string_char_at(input, index) != ' ' )
    index += 1;
    
option = string_copy(input, 2, index-2);
data = string_copy(input, index+1, strl-index+1);

show_debug_message("'"+option+"' : '" + data + "'");

if( first == '\' ) {
    var second = string_char_at(option, 1);
    if ( second == '\' ) {
        show_debug_message("Phone: '"+option+"' : '" + data + "'");
        global.option_phone = data;
        global.labeljump_phone = ds_map_find_value(global.script_labels, string_copy(option, 2, string_length(option)));
    } else {
        show_debug_message("Myself: '"+option+"' : '" + data + "'");
        global.options[global.count] = data;
        global.labeljump[global.count] = ds_map_find_value(global.script_labels, option);
        global.count += 1;
    }
    global.script_index += 1;
}
else if ( first == ':' ) {
    global.script_index += 1;
    ret = ParseOption();
}
else if ( first == '$' ) {
    show_debug_message("'"+option+"'");
    if( option == 'goto' ) {
        global.script_index = ds_map_find_value(global.script_labels, data);
        ret = ParseOption();
    } else {
        global.script_index += 1;
    }
}
else if ( first == '#' ) {
    global.script_index += 1;
}
else {
    global.script_index += 1;
    global.count = 0;
    global.options = 0;
    global.option_phone = undefined;
    global.labeljump_phone = undefined;
    global.rtext = input;
}

if( global.script_index < global.script_max_index and 
    string_char_at(global.script[global.script_index], 0) == '\' )
    ret = ParseOption();
    
return ret;

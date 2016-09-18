if( global.script_max_index == 0 )
    return 0;

global.options = 0;
global.count = 0;
global.rtext = global.script[global.script_index];
show_debug_message(global.rtext);

var next = global.script_index + 1;
while ( next < global.script_max_index and string_char_at(global.script[next], 0)=='\' ) {
    global.options[global.count] = global.script[next]
    global.count += 1;
    global.script_index += 1;
    next = global.script_index + 1;
}

if( global.count == 0 )
    global.options = 0;

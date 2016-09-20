global.in_game_menu = false;

var script_url = working_directory+"\Scripts\example.txt";
var file = file_text_open_read(script_url);

global.in_case_statement = false;
global.variables = ds_map_create();

global.script_labels = ds_map_create();
global.script_index = 0;
global.option_phone = undefined;
global.labeljump_phone = undefined;

global.script_max_index = 0
while ( !file_text_eof(file) ) {
    
    var line = string_trim(file_text_read_string(file));
    var strl = string_length(line);
    
    if ( strl != 0 ) {
        show_debug_message(line);
        global.script[global.script_max_index] = line;
        
        if( string_char_at(line, 0) == ':' ) {
            ds_map_add( global.script_labels,
                        string_copy(line, 2, strl-1),
                        global.script_max_index );
        }
        
        global.script_max_index += 1
    }
    
    file_text_readln(file);
}

ParseOption();

file_text_close(file);


if ( global.script_index >= global.script_max_index )
    return false;
    
var ret = true;

var input = global.script[global.script_index];
var strl = string_length(input);
var first = string_char_at(input, 1);

var parsed = string_parse(string_copy(input, 2, string_length(input)-1));
var option = parsed[0];
var data = parsed[1];

if( first == '\' ) {
    var second = string_char_at(option, 1);
    if ( second == '\' ) {
        var substr = string_copy(option, 2, string_length(option));
        global.option_phone = data;
        global.labeljump_phone = ds_map_find_value(global.script_labels, substr);
        show_debug_message("Phone: '"+substr+"' : '" + data + "'");
    } else {
        global.options[global.count] = data;
        global.labeljump[global.count] = ds_map_find_value(global.script_labels, option);
        global.count += 1;
        show_debug_message("Myself: '"+option+"' : '" + data + "'");
    }
    global.script_index += 1;
}
else if ( first == ':' or first == '#') {
    global.script_index += 1;
    ret = ParseOption();
}
else if ( first == '$' ) {
    if( option == 'no' ) {
        if ( data == 'saying' ) {
            global.narrator = '';
            global.script_index += 1;
            ret = ParseOption();
        }
        else if ( data == 'music' ) {
            audio_sound_gain(global.current_music, 0, 6000);
        }
        else {
            var results = string_parse(data);
            if ( results[0] == 'show' ) {
                var varname = results[1];
                if ( string_length(varname) > 0 ) {
                    var index = ds_map_find_value(global.portraits, varname);
                    global.portrait_alpha[index] = 0;
                }
                else {
                    var len = array_length_1d(global.portrait_alpha);
                    for ( var i=0;i<len;i+=1 ) {
                        global.portrait_alpha[i] = 0;
                    }
                }
                global.script_index += 1;
                ret = ParseOption();
            }
            else if ( results[0] == 'background' ) {
                SetBackgroundAlpha(-1);
                global.script_index += 1;
                ret = ParseOption();
            }
        }
    }
    else if ( option == 'saying' ) {
        global.narrator = data;
        global.script_index += 1;
        ret = ParseOption();
    }
    else if( option == 'goto' ) {
        global.script_index = ds_map_find_value(global.script_labels, data);
        ret = ParseOption();
    }
    else if ( option == 'set' ) {
        var results = string_parse(data);
        var varname = results[0];
        var vardata = results[1];
        ds_map_add(global.variables, varname, vardata);
        global.script_index += 1;
        ret = ParseOption();
    }
    else if ( option == 'show' ) {
        var results = string_parse(data);
        var varname = results[0];
        show_debug_message("SHOW " + varname);
        if( string_length(varname) > 0 ) {
            var vardata = real(results[1]);
            var index = ds_map_find_value(global.portraits, varname);
            global.portrait_alpha[index] = 1;
            global.portrait_position[index] = vardata;
            show_debug_message("SHOW @ " + string(vardata));
        }
        global.script_index += 1;
        ret = ParseOption();
    }
    else if ( option == 'background' ) {
        var results = string_parse(data);
        var varname = results[0];
        show_debug_message("BACKGROUND " + varname);
        if( string_length(varname) > 0 ) {
            var index = ds_map_find_value(global.backgrounds, varname);
            SetBackgroundAlpha(index)
        }
        global.script_index += 1;
        ret = ParseOption();
    }
    else if ( option == 'music' ) {
        var results = string_parse(data);
        var varname = results[0];
        show_debug_message("MUSIC " + varname);
        if( string_length(varname) > 0 ) {
            var index = ds_map_find_value(global.backgrounds, varname);
            var music = global.music_src[index];
            if( global.current_music != -1 ) {
                audio_sound_gain(global.current_music, 0, 6000);
            }
            global.current_music = audio_play_sound(music, 1, true);
            audio_sound_gain(global.current_music, 0, 0);
            audio_sound_gain(global.current_music, 0.5, 6000);
        }
        global.script_index += 1;
        ret = ParseOption();
    }
    else if ( option == 'case' ) {
        show_debug_message("CASE "+data);
        var tokens = string_full_parse(data);
        if( !global.in_case_statement and InterpretStatement(tokens) ) {
            global.in_case_statement = true;
            global.script_index += 1;
            ret = ParseOption();
        } else {
            var option = "";
            var data;
            while ( global.script_index+1 < global.script_max_index and option != "case" and option != "end" ) {
                global.script_index += 1;
                var next = global.script[global.script_index];
                var f = string_char_at(next, 1);
                if( f == '$' ) {
                    var parsed = string_parse(string_copy(next, 2, string_length(next)-1));
                    option = parsed[0];
                    data = parsed[1];
                }
            }
            if( option == "case" || option == "end" )
                ret = ParseOption();
        }
    }
    else if ( option == "end" ) {
        global.in_case_statement = false;
        show_debug_message("END");
        global.script_index += 1;
        ret = ParseOption();
    }
    else {
        global.script_index += 1;
    }
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

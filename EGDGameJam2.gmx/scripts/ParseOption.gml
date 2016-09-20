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
else if ( first == ':' ) {
    global.script_index += 1;
    ret = ParseOption();
}
else if ( first == '$' ) {
    if( option == 'goto' ) {
        global.script_index = ds_map_find_value(global.script_labels, data);
        ret = ParseOption();
    } else if ( option == 'set' ) {
        var results = string_parse(data);
        var varname = results[0];
        var vardata = results[1];
        ds_map_add(global.variables, varname, vardata);
        global.script_index += 1;
        ParseOption();
    } else if ( option == 'case' ) {
        show_debug_message("CASE "+data);
        var tokens = string_full_parse(data);
        if( !global.in_case_statement and InterpretStatement(tokens) ) {
            global.in_case_statement = true;
            global.script_index += 1;
            ParseOption();
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
    } else if ( option == "end" ) {
        global.in_case_statement = false;
        show_debug_message("END");
        global.script_index += 1;
        ParseOption();
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

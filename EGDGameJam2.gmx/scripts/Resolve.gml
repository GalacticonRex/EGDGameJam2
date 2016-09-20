var operator = argument0;

if ( ds_map_exists(global.variables, operator) )
    return ds_map_find_value(global.variables, operator);
else
    return operator;

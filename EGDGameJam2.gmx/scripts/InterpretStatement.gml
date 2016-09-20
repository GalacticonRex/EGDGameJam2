var tokens = argument0;
show_debug_message("INTERPRET");
return AndOr(tokens[0], Tail(tokens), 0);

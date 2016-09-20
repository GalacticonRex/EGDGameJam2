var operation = argument0;
var right = argument1;
var left = argument2;

show_debug_message("AND");

if( operation == '&' )
    return Equals(right[0], Tail(right), 0) and Equals(left[0], Tail(left), 0);
else if ( operation == '|' )
    return Equals(right[0], Tail(right), 0) or Equals(left[0], Tail(left), 0);
else if ( Empty(right) )
    return Equals(operation, left, 0);
else
    return AndOr(right[0], Tail(right), Combine(operation, left));

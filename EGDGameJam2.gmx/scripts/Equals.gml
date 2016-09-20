var operation = argument0;
var right = argument1;
var left = argument2;

if ( operation == '=' )
    return Resolve(right[0]) == Resolve(left[0]);
else if ( Empty(right) )
    return Resolve(operation);
else
    return Equals(right[0], Tail(right), Combine(operation, left));
    

var head = argument0;
var tail = argument1;
var len = array_length_1d(tail);
var ret;
ret[0] = head;
for (var i=0;i<len;i+=1)
    ret[i+1] = tail[i];
return ret;

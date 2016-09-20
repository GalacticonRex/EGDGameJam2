var arr = argument0;
var len = array_length_1d(arr);
var ret = 0;
for ( var i=1;i<len;i+=1 )
    ret[i-1] = arr[i];
return ret;

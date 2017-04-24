/// geon_string_parse(string, pos);

//  Cuts a string in two using delimiter.

/// http://www.steampanic.com/geonfx/

var str, part, delim, pos, result, len;
str = argument0;
part = argument2;
result = str;
delim = argument1;
len = string_length(str);

pos = string_pos(delim, str);
if part == 0 result = string_delete(str, pos, len-pos+1);
else if part == 1 result = string_delete(str, 1, pos);

return result;


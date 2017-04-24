/// geon_effect_read(fname, ps);

//  Loads new effect from a file fname and uses particle system ps to play it. 

/// http://www.steampanic.com/geonfx/

var ps, filename, file, str, em, effects, effect, key, value, effect_map, effect_system_map, i;

filename = argument[0];
ps = argument[1];

if !file_exists(filename) { return -1; }
file = file_text_open_read(filename);
if file = -1 { file_text_close(file); return -1; }

str = file_text_read_string(file);
if string_count("geon_file_start", str) == 0 { file_text_close(file); return -1; }
var format = real(geon_string_parse(str, "=", 1));

file_text_readln(file);
file_text_readln(file);

if format >= 5
{
    str = file_text_read_string(file);
    
    while str != "" 
    {
        file_text_readln(file);
        str = file_text_read_string(file);
    }
    
    file_text_readln(file);
}

effects = 0; 

while !file_text_eof(file) //Looping through file and parsing 
{
    str = file_text_read_string(file);
    if str != ""
    {
        if string_count("geon_file_end", str) == 0
        {
            effect_map[effects] = ds_map_create();
        
            while str != ""
            {
                key = geon_string_parse(str, "=", 0);
                value = geon_string_parse(str, "=", 1);
                if string_letters(key) != "" ds_map_add(effect_map[effects], key, value);
                file_text_readln(file);
                str = file_text_read_string(file);
            }
                effects += 1;
        }                   
    }
    else
    {
        file_text_readln(file);
    }
}
    
file_text_close(file);

//Updating all effects, linking them together
effect_system_map = ds_map_create();
    
for (i = 0; i < effects; i += 1)
{
    if ds_exists(effect_map[i], ds_type_map) geon_effect_init(effect_system_map, effect_map[i], i, ps);
}
                
ds_map_add(effect_system_map, "filename", filename);
ds_map_add(effect_system_map, "x", 0);
ds_map_add(effect_system_map, "y", 0);
ds_map_add(effect_system_map, "ps", ps);
ds_map_add(effect_system_map, "effects", effects);
ds_map_add(effect_system_map, "streamed", 0);
effect_system_ind = geon_effect_add_to_list(effect_system_map); //Adding resulting effect_system to global effects list
            
return effect_system_ind;  

/// geon_effect_id(fname);

//  Returns effect id by filename (if effect is loaded). Or -1 is effect doesn't exist in memory.

/// http://www.steampanic.com/geonfx/

var filename, size, map, i, map_fname;

filename = argument0;

size = ds_list_size(global.effect_systems_list);
    
for (i = 0; i < size; i += 1) 
{
    map = ds_list_find_value(global.effect_systems_list, i);
    if ds_exists(map, ds_type_map)
    {
        map_fname = ds_map_find_value(map, "filename");
        if map_fname == filename return i;
    }
}
    
return -1;

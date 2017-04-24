/// geon_effect_is_streamed(effect_ind);

//  Checks whether effect with index effect_ind is being streamed

/// http://www.steampanic.com/geonfx/

var effect_ind;
effect_ind = argument0;

if effect_ind < 0 return -1;

if ds_list_size(global.effect_systems_list) > effect_ind
{
    var map = ds_list_find_value(global.effect_systems_list, effect_ind);
    if ds_exists(map, ds_type_map) 
    {
        if ds_map_exists(map, "streamed") return map[? "streamed"];
    }
}

return -1;

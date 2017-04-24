/// geon_effect_add_to_list(effect_map);

//  Adds effect to global effects list and return effect id

/// http://www.steampanic.com/geonfx/

var list = global.effect_systems_list;
var effect_system = argument0;
var size = ds_list_size(list);
var ind = 0;

if size = 0
{
    ds_list_add(list, effect_system);
    return 0;
}
else
{
    for (var i = 0; i < size; i += 1)
    {
        ind = ds_list_find_value(list, i);
        if ind = -1
        {
            ds_list_replace(list, i, effect_system);
            return i; 
        }    
    }
    
    ds_list_add(list, effect_system);
    return size; 
}

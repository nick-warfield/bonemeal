/// geon_effect_delete(effect_ind, clear_pt);

//  Removes effect with index effect_ind from memory. If ( clear_pt == true ) particle types will be destroyed too. 

/// http://www.steampanic.com/geonfx/

var effect_ind = argument0;
var clear_pt = argument1;

var map = ds_list_find_value(global.effect_systems_list, effect_ind);

if ds_exists(map, ds_type_map)
{
    var effects = real(map[? "effects"]); //Counting subeffects
    var copy = ds_map_exists(map, "copy_of");

    for (var i = 0; i < effects; i += 1) //Cycling through them
    {
        var ind = string(i);
        
        var pt = real(map[? "pt"+ind]);
        var ps = real(map[? "ps"+ind]);
        
        if clear_pt
        {
            if part_type_exists(pt) part_type_destroy(pt); //Destroying particle types
        }
        
        if ds_map_exists(map, "pe"+ind)
        {
            if part_system_exists(ps)
            {
                var pe = real(map[? "pe"+ind]);
                if part_emitter_exists(ps, pe) part_emitter_destroy(ps, pe); //Destroying emitters
            }
        }
    }
    
    if copy or clear_pt 
    {
        ds_map_destroy(map); //Destroying the map with all effect system data
        if effect_ind == ds_list_size(global.effect_systems_list)-1 { ds_list_delete(global.effect_systems_list, effect_ind); }
        else ds_list_replace(global.effect_systems_list, effect_ind, -1);
    }
}

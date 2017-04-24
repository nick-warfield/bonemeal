/// geon_effect_add(fname, ps);

//  Loads new effect from a file fname and uses particle system ps to play it. 
//  If effect has already been loaded the script copies all effect settings and creates new emitters only.

//  http://www.steampanic.com/geonfx/

var filename, ps, present_effect_system_ind, new_effect_system_ind;

filename = argument[0];
ps = argument[1];

if !part_system_exists(ps) ps = global.geonfx_ps; //If provided particle system does not exist, use default one

present_effect_system_ind = geon_effect_id(filename);

if present_effect_system_ind = -1 
{   
    new_effect_system_ind = geon_effect_read(filename, ps);
}
else 
{    
    var map, map_copy;
    map = ds_list_find_value(global.effect_systems_list, present_effect_system_ind);
    if ds_exists(map, ds_type_map)
    {
        map_copy = ds_map_create();
        ds_map_copy(map_copy, map);
        var effects = map[? "effects"];
        var ind;
        for (var i = 0; i < effects; i += 1)
        {
            ind = string(i);
            if ds_map_exists(map, "pe"+ind)
            {
                var pe = real(map[? "pe"+ind]);
                var em = part_emitter_create(ps);
                map[? "pe"+ind] = em;
            }
        }
        
        map_copy[? "ps"] = ps;
        map_copy[? "streamed"] = false;
        map_copy[? "copy_of"] = map;
        new_effect_system_ind = geon_effect_add_to_list(map_copy);
    }
}

return new_effect_system_ind;

/// geon_effect_burst(effect_ind, x, y);

//  Play effect with index effect_ind at x, y once

/// http://www.steampanic.com/geonfx/

var effect_ind, xp, yp;
effect_ind = argument0;
xp = argument1;
yp = argument2;

if effect_ind < 0 return -1;

var map = ds_list_find_value(global.effect_systems_list, effect_ind);
if ds_exists(map, ds_type_map)
{  
    var i, size;
    size = map[? "effects"];
    for (i = 0; i < size; i += 1)
    {
        var ind, ps, pt, xadd, yadd, count;
        ind = string(i);
        ps = map[? "ps"+ind];
        pt = map[? "pt"+ind];
        xadd = map[? "xadd"+ind];
        yadd = map[? "yadd"+ind];
        count = map[? "count"+ind];
            
        if ds_map_exists(map, "pe"+ind)
        {
            var pe, width, height, shape, distr;
            pe = map[? "pe"+ind];
            width = map[? "width"+ind];
            height = map[? "height"+ind];
            shape = map[? "shape"+ind];
            distr = map[? "distr"+ind];
                
            part_emitter_region(ps, pe, xp+xadd-width, xp+xadd+width, yp+yadd-width, yp+yadd+width, shape, distr);
            part_emitter_burst(ps, pe, pt, count);
        }
        else
        {
            if !ds_map_exists(map, "parent") part_particles_create(ps, xp+xadd, yp+yadd, pt, count);
        }
    }
    map[? "x"] = xp;
    map[? "y"] = yp;
}    

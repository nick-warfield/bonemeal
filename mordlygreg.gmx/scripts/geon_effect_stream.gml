/// geon_effect_stream(effect_ind, x, y, enable);

//  Enable or disable effect streaming for effect_ind at x, y coordinates.

/// http://www.steampanic.com/geonfx/

var effect_ind, xp, yp, stream;
effect_ind = argument0;
xp = argument1;
yp = argument2;
stream = argument3;

if effect_ind < 0 return -1;

var map = ds_list_find_value(global.effect_systems_list, effect_ind);

if ds_exists(map, ds_type_map)
{  
    if map[? "x"] != xp or map[? "y"] != yp or map[? "streamed"] != stream
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
                                        
                part_emitter_region(ps, pe, xp+xadd-width, xp+xadd+width, yp+yadd-height, yp+yadd+height, shape, distr);
                if stream part_emitter_stream(ps, pe, pt, count);
                else part_emitter_stream(ps, pe, pt, 0);
            }
        }
        
        map[? "x"] = xp;
        map[? "y"] = yp;
        map[? "streamed"] = stream;
    }
}    

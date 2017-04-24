/// geon_system_init(ps);

//  Initializes Geon FX system and creates particle system if ps doesn't exist.

/// http://www.steampanic.com/geonfx/

var ps = argument[0];

global.geon_con = id;

global.effect_systems_list = ds_list_create();
global.geonfx_ps = -1;
global.ps_was_created = 0;

if !part_system_exists(ps)
{
    global.geonfx_ps = part_system_create();
    part_system_depth(global.geonfx_ps, -99);
    global.ps_was_created = 1;
}
else
{
    global.geonfx_ps = ps;
}

return global.geonfx_ps;


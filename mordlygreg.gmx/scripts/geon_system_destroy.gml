/// geon_system_destroy()

//  Clears Geon FX system and destroys the controller

/// http://www.steampanic.com/geonfx/

var i, size, map;

size = ds_list_size(global.effect_systems_list);
    
for (i = 0; i < size; i += 1) geon_effect_delete(i, true); //Removing all effects
    
ds_list_destroy(global.effect_systems_list); //Destroying the list
if global.ps_was_created { if part_system_exists(global.geonfx_ps) part_system_destroy(global.geonfx_ps); } //Destroying particle system if it was created

/// geon_effect_init(effect_system_map, effect_map, effect_index, ps);

//  Creates particle types and emitters. Applies all data gathered from a file. Is called from geon_effect_add().

/// http://www.steampanic.com/geonfx/

var effect_system_map = argument[0]
var effect_map = argument[1];
var ind = argument[2];
var ps = argument[3];

var partshape = pt_shape_pixel;
var shape = ps_shape_rectangle;
var distr = ps_distr_linear;

//Converting shape names to shape ids 
switch effect_map[? "partshape_name"]
{
    case "pt_shape_pixel": partshape = pt_shape_pixel; break;
    case "pt_shape_disk": partshape = pt_shape_disk; break;
    case "pt_shape_square": partshape = pt_shape_square; break;
    case "pt_shape_line": partshape = pt_shape_line; break;
    case "pt_shape_star": partshape = pt_shape_star; break;
    case "pt_shape_circle": partshape = pt_shape_circle; break;
    case "pt_shape_ring": partshape = pt_shape_ring; break;
    case "pt_shape_sphere": partshape = pt_shape_sphere; break;
    case "pt_shape_flare": partshape = pt_shape_flare; break;
    case "pt_shape_spark": partshape = pt_shape_spark; break;
    case "pt_shape_explosion": partshape = pt_shape_explosion; break;
    case "pt_shape_cloud": partshape = pt_shape_cloud; break;
    case "pt_shape_smoke": partshape = pt_shape_smoke; break;
    case "pt_shape_snow": partshape = pt_shape_snow; break;
}

switch effect_map[? "shape_name"] 
{
    case "ps_shape_line": shape = ps_shape_line; break;
    case "ps_shape_ellipse": shape = ps_shape_ellipse; break;
    case "ps_shape_rectangle": shape = ps_shape_rectangle; break;
    case "ps_shape_diamond": shape = ps_shape_diamond; break;
}

switch effect_map[? "distr_name"]
{
    case "ps_distr_linear": distr = ps_distr_linear; break;
    case "ps_distr_gaussian": distr = ps_distr_gaussian; break;
    case "ps_distr_invgaussian": distr = ps_distr_invgaussian; break;
}

//Reading particle type values from a temp map
var partsizemin = real(effect_map[? "partsizemin"]);
var partsizemax = real(effect_map[? "partsizemax"]);
var partsizeincr = real(effect_map[? "partsizeincr"]);
var partsizewig = real(effect_map[? "partsizewig"]);

var partscalex = real(effect_map[? "partscalex"]);
var partscaley = real(effect_map[? "partscaley"]);

var partorimin = real(effect_map[? "partorimin"]);
var partorimax = real(effect_map[? "partorimax"]);
var partoriincr = real(effect_map[? "partoriincr"]);
var partoriwig = real(effect_map[? "partoriwig"]);
var partorirel = real(effect_map[? "partorirel"]);

var partcolone = real(effect_map[? "partcolone"]);
var partcoltwo = real(effect_map[? "partcoltwo"]);
var partcolthr = real(effect_map[? "partcolthr"]);

var partalpone = real(effect_map[? "partalpone"]);
var partalptwo = real(effect_map[? "partalptwo"]);
var partalpthr = real(effect_map[? "partalpthr"]);

var partblend = real(effect_map[? "partblend"]);

var partlifemin = real(effect_map[? "partlifemin"]);
var partlifemax = real(effect_map[? "partlifemax"]);

var partspdmin = real(effect_map[? "partspdmin"]);
var partspdmax = real(effect_map[? "partspdmax"]);
var partspdincr = real(effect_map[? "partspdincr"]);
var partspdwig = real(effect_map[? "partspdwig"]);

var partdirmin = real(effect_map[? "partdirmin"]);
var partdirmax = real(effect_map[? "partdirmax"]);
var partdirincr = real(effect_map[? "partdirincr"]);
var partdirwig = real(effect_map[? "partdirwig"]);

var partgrav = real(effect_map[? "partgrav"]);
var partgravdir = real(effect_map[? "partgravdir"]);

var animat = real(effect_map[? "animat"]);
var stretch = real(effect_map[? "stretch"]);
var rand = real(effect_map[? "rand"]);

var xadd = real(effect_map[? "xadd"]);
var yadd = real(effect_map[? "yadd"]);

var width = real(effect_map[? "width"]);
var height = real(effect_map[? "height"]);

var count = real(effect_map[? "count"]);
var name = effect_map[? "name"];

var part_form = real(effect_map[? "part_form"]);
if is_undefined(part_form) part_form = 0;

//Defining particle type 
var part = part_type_create();
part_type_shape(part, partshape)
part_type_size(part, partsizemin, partsizemax, partsizeincr, partsizewig);
part_type_scale(part, partscalex, partscaley);
part_type_orientation(part, partorimin, partorimax, partoriincr, partoriwig, partorirel);
part_type_color3(part, partcolone, partcoltwo, partcolthr);
part_type_alpha3(part, partalpone, partalptwo, partalpthr);
part_type_blend(part, partblend);
part_type_life(part, partlifemin, partlifemax);
part_type_speed(part, partspdmin, partspdmax, partspdincr, partspdwig);
part_type_direction(part, partdirmin, partdirmax, partdirincr, partdirwig);
part_type_gravity(part, partgrav, partgravdir);

if part_form < 2
{
    var spr_name = "";
    if part_form == 0 { spr_name = "spr_"+effect_map[? "partshape_name"]; } //GMS 1 particle shape
    else if part_form == 1 { spr_name = "spr_"+effect_map[? "partshape_name"]+"_new"; } //GMS 2 particle shape
    
    var spr_ind = asset_get_index(spr_name);
    if spr_ind != -1 { if sprite_exists(spr_ind) { part_type_sprite(part, spr_ind, 0, 0, 0); } }
}

//Setting sprite as a particle shape
var sprite = string(effect_map[? "sprite"]); 
sprite = string_replace(sprite, filename_ext(sprite), ""); //geon_string_parse(sprite, ".", 0);
var spr_ind = asset_get_index(sprite);
if spr_ind != -1 { if sprite_exists(spr_ind) { part_type_sprite(part, spr_ind, animat, stretch, rand); } }

var create_emitter = 1;

//Linking Death and Step types
var run_after_name = "";
var run_after_count = 0;
var run_step_name = "";
var run_step_count = 0;

if ds_map_exists(effect_map, "run_after_name")
{
    run_after_name = effect_map[? "run_after_name"];
    run_after_count = real(effect_map[? "run_after_count"]);
    ds_map_add(effect_system_map, "run_after_name"+string(ind), run_after_name);
    ds_map_add(effect_system_map, "run_after_count"+string(ind), run_after_count);
}

if ds_map_exists(effect_map, "run_step_name")
{
    run_step_name = effect_map[? "run_step_name"];
    run_step_count = real(effect_map[? "run_step_count"]);
    ds_map_add(effect_system_map, "run_step_name"+string(ind), run_step_name);
    ds_map_add(effect_system_map, "run_step_count"+string(ind), run_step_count);
}

for (var i = 0; i < ind; i += 1)
{
    var ind_connected = string(i);
    
    if run_after_name != ""
    {
        if effect_system_map[? "name"+ind_connected] == run_after_name
        {
            part_type_death(part, run_after_count, effect_system_map[? "pt"+ind_connected]);
        }
    }
    
    if run_step_name != ""
    {
        if effect_system_map[? "name"+ind_connected] == run_step_name
        {
            part_type_step(part, run_step_count, effect_system_map[? "pt"+ind_connected]);
        }
    }
    
    if ds_map_exists(effect_system_map, "run_after_name"+ind_connected)
    {
        if effect_system_map[? "run_after_name"+ind_connected] == name
        {
            part_type_death(effect_system_map[? "pt"+ind_connected], effect_system_map[? "run_after_count"+ind_connected], part);
            create_emitter = 0;
            ds_map_add( effect_system_map, "parent", real(ind_connected) );
        }
    }
    
    if ds_map_exists(effect_system_map, "run_step_name"+ind_connected)
    {
        if effect_system_map[? "run_step_name"+ind_connected] == name
        {
            part_type_step(effect_system_map[? "pt"+ind_connected], effect_system_map[? "run_step_count"+ind_connected], part);
            create_emitter = 0;
            ds_map_add( effect_system_map, "parent", real(ind_connected) );
        }
    }
}

//Writing to effect_system map
ds_map_add(effect_system_map, "name"+string(ind), name);
ds_map_add(effect_system_map, "ps"+string(ind), ps);
ds_map_add(effect_system_map, "pt"+string(ind), part);
ds_map_add(effect_system_map, "count"+string(ind), count);
ds_map_add(effect_system_map, "xadd"+string(ind), xadd);
ds_map_add(effect_system_map, "yadd"+string(ind), yadd);

//Creating emitters if necessary
if (width > 0 or height > 0) and create_emitter
{
    var emitter = part_emitter_create(ps);
    ds_map_add(effect_system_map, "pe"+string(ind), emitter);
    ds_map_add(effect_system_map, "width"+string(ind), width);
    ds_map_add(effect_system_map, "height"+string(ind), height);
    ds_map_add(effect_system_map, "shape"+string(ind), shape);
    ds_map_add(effect_system_map, "distr"+string(ind), distr);
}

//Destroying individual effect map
ds_map_destroy(effect_map);

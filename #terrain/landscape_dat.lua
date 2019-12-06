-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local
local tiles_mapColor = {}
local tiles_tint     = {}
local decals_tint    = {}
local entities_tint  = {}
local trees_tint     = {}

-------------------------------------------------------------------------------- Sets tiles walking speed modifier
for _, v_tile in pairs( data.raw.tile ) do
    if     v_tile.name:find( '-sand-' )   then v_tile.walking_speed_modifier = 0.70
    elseif v_tile.name:find( '-snow-' )   then v_tile.walking_speed_modifier = 0.50
    elseif v_tile.name == 'water-shallow' or v_tile.name == 'water-mud' then
        v_tile.walking_speed_modifier = 0.30
    elseif util.string_starts_with( v_tile.name, 'volcanic-' ) then
        v_tile.walking_speed_modifier = 1
    end
end


--______________________________________________________________________________________________________________________
--############################################################################## MAP COLORS ############################

-------------------------------------------------------------------------------- Dirt beige
tiles_mapColor[      'mineral-beige-dirt-1' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-2' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-4' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-3' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-5' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-6' ] = { r =  40, g =  35, b =  25 }
-------------------------------------------------------------------------------- Dirt dustyrose
tiles_mapColor[  'mineral-dustyrose-dirt-1' ] = { r = 200, g =  80, b = 200 }
tiles_mapColor[  'mineral-dustyrose-dirt-2' ] = { r = 200, g =  80, b = 200 }
tiles_mapColor[  'mineral-dustyrose-dirt-4' ] = { r = 200, g =  80, b = 200 }
tiles_mapColor[  'mineral-dustyrose-dirt-3' ] = { r = 200, g =  80, b = 200 }
tiles_mapColor[  'mineral-dustyrose-dirt-5' ] = { r = 200, g =  80, b = 200 }
tiles_mapColor[  'mineral-dustyrose-dirt-6' ] = { r = 200, g =  80, b = 200 }
-------------------------------------------------------------------------------- Dirt red
tiles_mapColor[        'mineral-red-dirt-1' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-2' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-4' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-3' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-5' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-6' ] = { r =  65, g =  30, b =  25 }
-------------------------------------------------------------------------------- Grass green
tiles_mapColor[  'vegetation-green-grass-1' ] = { r =   0, g =  50, b =   0 }
tiles_mapColor[  'vegetation-green-grass-2' ] = { r =   0, g =  50, b =   0 }
tiles_mapColor[  'vegetation-green-grass-3' ] = { r =   0, g =  50, b =   0 }
tiles_mapColor[  'vegetation-green-grass-4' ] = { r =   0, g =  50, b =   0 }
-------------------------------------------------------------------------------- Grass olive
tiles_mapColor[  'vegetation-olive-grass-1' ] = { r =  40, g =  70, b =  30 }
tiles_mapColor[  'vegetation-olive-grass-2' ] = { r =  40, g =  70, b =  30 }
-------------------------------------------------------------------------------- Grass yellow
tiles_mapColor[ 'vegetation-yellow-grass-1' ] = { r =  80, g =  85, b =  25 }
tiles_mapColor[ 'vegetation-yellow-grass-2' ] = { r =  80, g =  85, b =  25 }
-------------------------------------------------------------------------------- Grass orange
tiles_mapColor[ 'vegetation-orange-grass-1' ] = { r =  95, g =  45, b =  25 }
tiles_mapColor[ 'vegetation-orange-grass-2' ] = { r =  95, g =  45, b =  25 }
-------------------------------------------------------------------------------- Desert tan
tiles_mapColor[        'mineral-tan-sand-1' ] = { r = 180, g = 160, b = 120 }
tiles_mapColor[        'mineral-tan-sand-2' ] = { r = 180, g = 160, b = 120 }
tiles_mapColor[        'mineral-tan-sand-3' ] = { r = 180, g = 160, b = 120 }
-------------------------------------------------------------------------------- Volcanic
tiles_mapColor[    'volcanic-orange-heat-1' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-2' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-3' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-4' ] = { r =  13, g =  13, b =  13 }
-------------------------------------------------------------------------------- Water
--[[ keep original colors
tiles_mapColor[                 'deepwater' ] = { r =  33, g =  65, b =  74 }
tiles_mapColor[                     'water' ] = { r =  49, g =  81, b =  90 }
tiles_mapColor[             'water-shallow' ] = { r =  49, g =  97, b = 107 }]]
tiles_mapColor[                 'water-mud' ] = { r =  35, g =  80, b =  75 }
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## TILES #################################

-------------------------------------------------------------------------------- Dirt beige
data.raw.tile[ 'mineral-beige-dirt-2' ].variants = data.raw.tile[ 'mineral-beige-dirt-4' ].variants

tiles_tint[      'mineral-beige-dirt-1' ] = { r = 170, g = 160, b = 175 }
tiles_tint[      'mineral-beige-dirt-2' ] = { r = 205, g = 190, b = 200 }
tiles_tint[      'mineral-beige-dirt-3' ] = { r = 205, g = 190, b = 200 }
tiles_tint[      'mineral-beige-dirt-4' ] = { r = 210, g = 195, b = 200 }
tiles_tint[      'mineral-beige-dirt-5' ] = { r = 185, g = 165, b = 165 }
tiles_tint[      'mineral-beige-dirt-6' ] = { r = 160, g = 145, b = 150 }
-------------------------------------------------------------------------------- Dirt dustyrose
tiles_tint[  'mineral-dustyrose-dirt-1' ] = { r = 200, g = 200, b = 200 }
tiles_tint[  'mineral-dustyrose-dirt-2' ] = { r = 200, g = 200, b = 200 }
tiles_tint[  'mineral-dustyrose-dirt-3' ] = { r = 200, g = 200, b = 200 }
tiles_tint[  'mineral-dustyrose-dirt-4' ] = { r = 200, g = 200, b = 200 }
tiles_tint[  'mineral-dustyrose-dirt-5' ] = { r = 200, g = 200, b = 200 }
tiles_tint[  'mineral-dustyrose-dirt-6' ] = { r = 200, g = 200, b = 200 }
-------------------------------------------------------------------------------- Dirt red
data.raw.tile[ 'mineral-red-dirt-4' ].variants = data.raw.tile[ 'mineral-red-dirt-2' ].variants

tiles_tint[        'mineral-red-dirt-1' ] = { r = 160, g = 240, b = 235 }
tiles_tint[        'mineral-red-dirt-2' ] = { r = 180, g = 245, b = 230 }
tiles_tint[        'mineral-red-dirt-3' ] = { r = 180, g = 240, b = 220 }
tiles_tint[        'mineral-red-dirt-4' ] = { r = 185, g = 250, b = 235 }
tiles_tint[        'mineral-red-dirt-5' ] = { r = 160, g = 200, b = 185 }
tiles_tint[        'mineral-red-dirt-6' ] = { r = 150, g = 215, b = 210 }
-------------------------------------------------------------------------------- Grass green
data.raw.tile[ 'vegetation-green-grass-1' ].variants = data.raw.tile[ 'vegetation-green-grass-2' ].variants

tiles_tint[  'vegetation-green-grass-1' ] = { r = 145, g = 135, b = 255 }
tiles_tint[  'vegetation-green-grass-2' ] = { r = 150, g = 140, b = 255 }
tiles_tint[  'vegetation-green-grass-3' ] = { r = 160, g = 150, b = 235 }
tiles_tint[  'vegetation-green-grass-4' ] = { r = 160, g = 160, b = 240 }
-------------------------------------------------------------------------------- Grass olive
data.raw.tile[ 'vegetation-olive-grass-1' ].variants = data.raw.tile[ 'vegetation-green-grass-1' ].variants
data.raw.tile[ 'vegetation-olive-grass-2' ].variants = data.raw.tile[ 'vegetation-green-grass-3' ].variants

tiles_tint[  'vegetation-olive-grass-1' ] = { r = 175, g = 175, b = 240 }
tiles_tint[  'vegetation-olive-grass-2' ] = { r = 170, g = 190, b = 190 }
-------------------------------------------------------------------------------- Grass yellow
data.raw.tile[ 'vegetation-yellow-grass-1' ].variants = data.raw.tile[ 'vegetation-yellow-grass-2' ].variants

tiles_tint[ 'vegetation-yellow-grass-1' ] = { r = 190, g = 175, b = 195 }
tiles_tint[ 'vegetation-yellow-grass-2' ] = { r = 180, g = 170, b = 180 }
-------------------------------------------------------------------------------- Grass orange
data.raw.tile[ 'vegetation-orange-grass-1' ].variants = data.raw.tile[ 'vegetation-orange-grass-2' ].variants

tiles_tint[ 'vegetation-orange-grass-1' ] = { r = 200, g = 210, b = 225 }
tiles_tint[ 'vegetation-orange-grass-2' ] = { r = 185, g = 200, b = 205 }
-------------------------------------------------------------------------------- Desert tan
data.raw.tile[ 'mineral-tan-sand-1' ].variants = data.raw.tile[ 'mineral-tan-sand-2'   ].variants
data.raw.tile[ 'mineral-tan-sand-3' ].variants = data.raw.tile[ 'mineral-white-sand-3' ].variants

tiles_tint[        'mineral-tan-sand-1' ] = { r = 245, g = 235, b = 230 }
tiles_tint[        'mineral-tan-sand-2' ] = { r = 245, g = 230, b = 225 }
tiles_tint[        'mineral-tan-sand-3' ] = { r = 240, g = 180, b = 110 }
-------------------------------------------------------------------------------- Volcanic
data.raw.tile[ 'volcanic-orange-heat-2' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-3' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-4' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants

tiles_tint[    'volcanic-orange-heat-1' ] = { r = 235, g = 235, b = 235 }
tiles_tint[    'volcanic-orange-heat-2' ] = { r = 215, g = 215, b = 215 }
tiles_tint[    'volcanic-orange-heat-3' ] = { r = 200, g = 200, b = 200 }
tiles_tint[    'volcanic-orange-heat-4' ] = { r = 180, g = 180, b = 180 }
-------------------------------------------------------------------------------- Water
tiles_tint[                 'deepwater' ] = { r = 255, g = 100, b = 100 }
tiles_tint[                     'water' ] = { r = 255, g = 120, b = 120 }
tiles_tint[             'water-shallow' ] = { r = 190, g = 160, b = 180 }
tiles_tint[                 'water-mud' ] = { r = 120, g = 140, b = 120 }
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## DECALS ################################

-------------------------------------------------------------------------------- Dirt red
decals_tint[ 'sand-decal-red'  ] = { r = 210, g = 180, b = 160 }
decals_tint[ 'stone-decal-red' ] = { r = 210, g = 180, b = 160 }
-------------------------------------------------------------------------------- Grass orange
decals_tint[ 'sand-decal-tan'  ] = { r = 190, g = 140, b = 110 }
decals_tint[ 'stone-decal-tan' ] = { r = 190, g = 140, b = 110 }
-------------------------------------------------------------------------------- Desert tan
decals_tint[ 'sand-dune-decal-tan' ] = { r = 230, g = 215, b = 195 }
-------------------------------------------------------------------------------- Volcanic
local decal = data.raw[ 'optimized-decorative' ][ 'lava-decal-orange' ]
decal.autoplace.default_enabled = false
decals_tint[ 'puddle-decal'   ] = { r = 255, g =  80, b = 100 }
--decals_tint[ 'dark-mud-decal' ] = { r = 140, g = 140, b = 180 }--orange biome
--decals_tint[ 'puberty-decal'  ] = { r = 140, g = 140, b = 180 }
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## BUSHES ################################

decals_tint[ 'flower-bush-green-yellow' ] = { r = 180, g = 180, b = 180 }
--decals_tint[   'flower-bush-green-blue' ] = { r = 180, g = 180, b = 180 }
-------------------------------------------------------------------------------- Volcanic
decals_tint[ 'brown-fluff-dry' ] = { r = 180, g = 180, b = 220 }
decals_tint[ 'red-desert-bush' ] = { r = 180, g = 160, b = 200 }
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## ROCKS #################################

-------------------------------------------------------------------------------- Grass green
decals_tint[         'rock-tiny-tan' ] = { r = 180, g = 130, b = 85 }
decals_tint[        'rock-small-tan' ] = { r = 180, g = 130, b = 85 }
decals_tint[       'rock-medium-tan' ] = { r = 180, g = 130, b = 85 }
entities_tint[        'rock-big-tan' ] = { r = 180, g = 130, b = 85 }
entities_tint[       'rock-huge-tan' ] = { r = 180, g = 130, b = 85 }
-------------------------------------------------------------------------------- Desert tan
decals_tint[   'sand-rock-small-tan' ] = { r = 255, g = 200, b = 130 }
decals_tint[  'sand-rock-medium-tan' ] = { r = 255, g = 200, b = 130 }
entities_tint[   'sand-rock-big-tan' ] = { r = 255, g = 200, b = 130 }
-------------------------------------------------------------------------------- Grass olive, Dirt beige
decals_tint[       'rock-tiny-beige' ] = { r = 180, g = 150, b = 95 }
decals_tint[      'rock-small-beige' ] = { r = 180, g = 150, b = 95 }
decals_tint[     'rock-medium-beige' ] = { r = 180, g = 150, b = 95 }
entities_tint[      'rock-big-beige' ] = { r = 180, g = 150, b = 95 }
entities_tint[     'rock-huge-beige' ] = { r = 180, g = 150, b = 95 }
-------------------------------------------------------------------------------- Grass yellow
decals_tint[       'rock-tiny-cream' ] = { r = 185, g = 150, b = 90 }
decals_tint[      'rock-small-cream' ] = { r = 185, g = 150, b = 90 }
decals_tint[     'rock-medium-cream' ] = { r = 185, g = 150, b = 90 }
entities_tint[      'rock-big-cream' ] = { r = 185, g = 150, b = 90 }
entities_tint[     'rock-huge-cream' ] = { r = 185, g = 150, b = 90 }
-------------------------------------------------------------------------------- Grass orange
decals_tint[       'rock-tiny-brown' ] = { r = 180, g = 130, b = 85 }
decals_tint[      'rock-small-brown' ] = { r = 180, g = 130, b = 85 }
decals_tint[     'rock-medium-brown' ] = { r = 180, g = 130, b = 85 }
entities_tint[      'rock-big-brown' ] = { r = 180, g = 130, b = 85 }
entities_tint[     'rock-huge-brown' ] = { r = 180, g = 130, b = 85 }
-------------------------------------------------------------------------------- Dirt red
decals_tint[         'rock-tiny-red' ] = { r = 150, g = 115, b =  90 }
decals_tint[        'rock-small-red' ] = { r = 150, g = 115, b =  90 }
decals_tint[       'rock-medium-red' ] = { r = 150, g = 115, b =  90 }
entities_tint[        'rock-big-red' ] = { r = 150, g = 115, b =  90 }
entities_tint[       'rock-huge-red' ] = { r = 150, g = 115, b =  90 }
-------------------------------------------------------------------------------- Dirt dustyrose
decals_tint[   'rock-tiny-dustyrose' ] = { r = 180, g = 150, b = 95 }
decals_tint[  'rock-small-dustyrose' ] = { r = 180, g = 150, b = 95 }
decals_tint[ 'rock-medium-dustyrose' ] = { r = 180, g = 150, b = 95 }
entities_tint[  'rock-big-dustyrose' ] = { r = 180, g = 150, b = 95 }
entities_tint[ 'rock-huge-dustyrose' ] = { r = 180, g = 150, b = 95 }
-------------------------------------------------------------------------------- Volcanic
decals_tint[       'rock-tiny-black' ] = { r = 110, g = 100, b = 100 }
decals_tint[      'rock-small-black' ] = { r = 110, g = 100, b = 100 }
decals_tint[     'rock-medium-black' ] = { r = 110, g = 100, b = 100 }
entities_tint[      'rock-big-black' ] = { r = 110, g = 100, b = 100 }
entities_tint[     'rock-huge-black' ] = { r = 110, g = 100, b = 100 }
--[[ keep original colors
decals_tint[    'rock-tiny-volcanic' ] = { r = 100, g = 90, b = 90 }
decals_tint[   'rock-small-volcanic' ] = { r = 100, g = 90, b = 90 }
decals_tint[  'rock-medium-volcanic' ] = { r = 100, g = 90, b = 90 }
entities_tint[   'rock-big-volcanic' ] = { r =  80, g = 80, b = 80 }
entities_tint[  'rock-huge-volcanic' ] = { r =  80, g = 80, b = 80 }]]
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## TREES #################################

-------------------------------------------------------------------------------- Volcanic
-- Medusa tree
trees_tint[ 'tree-volcanic-a' ] = {}
trees_tint[ 'tree-volcanic-a' ].leaves = { r = 200, g = 200, b = 255 }
trees_tint[ 'tree-volcanic-a' ].trunk  = { r = 100, g = 120, b = 120 }
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## APPLYING COLORS #######################

-------------------------------------------------------------------------------- Map colors
for name, color in pairs( tiles_mapColor ) do
    data.raw.tile[ name ].map_color = color
end

-------------------------------------------------------------------------------- Tiles
for name, color in pairs( tiles_tint ) do
    data.raw.tile[ name ].tint = color
end

-------------------------------------------------------------------------------- Optimized-decoratives
for name, color in pairs( decals_tint ) do
    local decal = data.raw[ 'optimized-decorative' ][ name ]
    for _, v_pic in pairs( decal.pictures ) do
        v_pic.tint = color
        if v_pic.hr_version then
            v_pic.hr_version.tint = color
        end
    end
end

-------------------------------------------------------------------------------- Simple-entities
for name, color in pairs( entities_tint ) do
    local rock = data.raw[ 'simple-entity' ][ name ]
    for _, v_pic in pairs ( rock.pictures ) do
        v_pic.tint = color
        if v_pic.hr_version then
            v_pic.hr_version.tint = color
        end
    end
end

-------------------------------------------------------------------------------- Trees
for name, color in pairs( trees_tint ) do
    local tree = data.raw.tree[ name ]
    for _, v_var in pairs ( tree.variations ) do
        local leavesColor = trees_tint[ name ].leaves
        v_var.leaves.tint = leavesColor
        if v_var.leaves.hr_version then
            v_var.leaves.hr_version.tint = leavesColor
        end
        local trunkColor = trees_tint[ name ].trunk
        v_var.trunk.tint = trunkColor
        if v_var.trunk.hr_version then
           v_var.trunk.hr_version.tint = trunkColor
        end
    end
end


--______________________________________________________________________________________________________________________
--######################################################################################################################
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


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

local tintD  = {} -- Decoratives tints
local tintSE = {} -- Simple entities tints
local tintF  = {} -- Trees tints


--______________________________________________________________________________________________________________________
--############################################################################## WATER #################################

data.raw.tile[ 'deepwater'     ].tint = { r = 255, g = 100, b = 100 }
data.raw.tile[ 'water'         ].tint = { r = 255, g = 120, b = 120 }
data.raw.tile[ 'water-mud'     ].tint = { r = 220, g = 160, b = 170 }
data.raw.tile[ 'water-shallow' ].tint = { r = 190, g = 160, b = 180 }


--______________________________________________________________________________________________________________________
--############################################################################## MAP COLORS ############################

local tiles_mapColor = {}

-------------------------------------------------------------------------------- Volcanic
tiles_mapColor[    'volcanic-orange-heat-1' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-2' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-3' ] = { r =  13, g =  13, b =  13 }
tiles_mapColor[    'volcanic-orange-heat-4' ] = { r =  13, g =  13, b =  13 }
-------------------------------------------------------------------------------- Dirt red
tiles_mapColor[        'mineral-red-dirt-1' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-2' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-4' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-3' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-5' ] = { r =  65, g =  30, b =  25 }
tiles_mapColor[        'mineral-red-dirt-6' ] = { r =  65, g =  30, b =  25 }
-------------------------------------------------------------------------------- Dirt beige
tiles_mapColor[      'mineral-beige-dirt-1' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-2' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-4' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-3' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-5' ] = { r =  40, g =  35, b =  25 }
tiles_mapColor[      'mineral-beige-dirt-6' ] = { r =  40, g =  35, b =  25 }
-------------------------------------------------------------------------------- Grass olive
tiles_mapColor[  'vegetation-olive-grass-1' ] = { r =  40, g =  70, b =  30 }
tiles_mapColor[  'vegetation-olive-grass-2' ] = { r =  40, g =  70, b =  30 }
-------------------------------------------------------------------------------- Grass orange
tiles_mapColor[ 'vegetation-orange-grass-1' ] = { r =  95, g =  45, b =  25 }
tiles_mapColor[ 'vegetation-orange-grass-2' ] = { r =  95, g =  45, b =  25 }
-------------------------------------------------------------------------------- Desert tan
tiles_mapColor[        'mineral-tan-sand-1' ] = { r = 180, g = 160, b = 120 }
tiles_mapColor[        'mineral-tan-sand-2' ] = { r = 180, g = 160, b = 120 }
tiles_mapColor[        'mineral-tan-sand-3' ] = { r = 180, g = 160, b = 120 }
--------------------------------------------------------------------------------

for k, v in pairs( tiles_mapColor ) do
    data.raw.tile[ k ].map_color = v
end

--______________________________________________________________________________________________________________________
--############################################################################## TILES #################################

local tiles_tint = {}

-------------------------------------------------------------------------------- Volcanic
data.raw.tile[ 'volcanic-orange-heat-2' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-3' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants
data.raw.tile[ 'volcanic-orange-heat-4' ].variants  = data.raw.tile[ 'volcanic-orange-heat-1' ].variants

tiles_tint[    'volcanic-orange-heat-1' ] = { r = 235, g = 235, b = 235 }
tiles_tint[    'volcanic-orange-heat-2' ] = { r = 215, g = 215, b = 215 }
tiles_tint[    'volcanic-orange-heat-3' ] = { r = 200, g = 200, b = 200 }
tiles_tint[    'volcanic-orange-heat-4' ] = { r = 180, g = 180, b = 180 }
-------------------------------------------------------------------------------- Dirt red
data.raw.tile[ 'mineral-red-dirt-4' ].variants = data.raw.tile[ 'mineral-red-dirt-2' ].variants

tiles_tint[        'mineral-red-dirt-1' ] = { r = 160, g = 240, b = 235 }
tiles_tint[        'mineral-red-dirt-2' ] = { r = 180, g = 245, b = 230 }
tiles_tint[        'mineral-red-dirt-3' ] = { r = 180, g = 240, b = 220 }
tiles_tint[        'mineral-red-dirt-4' ] = { r = 185, g = 250, b = 235 }
tiles_tint[        'mineral-red-dirt-5' ] = { r = 160, g = 200, b = 185 }
tiles_tint[        'mineral-red-dirt-6' ] = { r = 150, g = 215, b = 210 }
-------------------------------------------------------------------------------- Dirt beige
data.raw.tile[ 'mineral-beige-dirt-2' ].variants = data.raw.tile[ 'mineral-beige-dirt-4' ].variants

tiles_tint[      'mineral-beige-dirt-1' ] = { r = 170, g = 160, b = 175 }
tiles_tint[      'mineral-beige-dirt-2' ] = { r = 205, g = 190, b = 200 }
tiles_tint[      'mineral-beige-dirt-3' ] = { r = 205, g = 190, b = 200 }
tiles_tint[      'mineral-beige-dirt-4' ] = { r = 210, g = 195, b = 200 }
tiles_tint[      'mineral-beige-dirt-5' ] = { r = 185, g = 165, b = 165 }
tiles_tint[      'mineral-beige-dirt-6' ] = { r = 160, g = 145, b = 150 }
-------------------------------------------------------------------------------- Grass olive
tiles_tint[  'vegetation-olive-grass-1' ] = { r = 195, g = 210, b = 220 }
tiles_tint[  'vegetation-olive-grass-2' ] = { r = 200, g = 220, b = 230 }
-------------------------------------------------------------------------------- Grass orange
data.raw.tile[ 'vegetation-orange-grass-1' ].variants = data.raw.tile[ 'vegetation-orange-grass-2' ].variants

tiles_tint[ 'vegetation-orange-grass-1' ] = { r = 200, g = 210, b = 225 }
tiles_tint[ 'vegetation-orange-grass-2' ] = { r = 185, g = 200, b = 205 }
-------------------------------------------------------------------------------- Desert tan
tiles_tint[        'mineral-tan-sand-1' ] = { r = 230, g = 230, b = 230 }
tiles_tint[        'mineral-tan-sand-2' ] = { r = 230, g = 230, b = 230 }
tiles_tint[        'mineral-tan-sand-3' ] = { r = 255, g = 255, b = 255 }
--------------------------------------------------------------------------------

for k, v in pairs( tiles_tint ) do
    data.raw.tile[ k ].tint = v
end

--______________________________________________________________________________________________________________________
--############################################################################## DECALS ################################

-------------------------------------------------------------------------------- Volcanic
local decal = data.raw[ 'optimized-decorative' ][ 'lava-decal-orange' ]
decal.autoplace.default_enabled = false
tintD[ 'puddle-decal'   ] = { r = 255, g =  80, b = 100 }
--tintD[ 'dark-mud-decal' ] = { r = 140, g = 140, b = 180 }--orange biome
--tintD[ 'puberty-decal'  ] = { r = 140, g = 140, b = 180 }
-------------------------------------------------------------------------------- Dirt red
tintD[ 'sand-decal-red'  ] = { r = 210, g = 180, b = 160 }
tintD[ 'stone-decal-red' ] = { r = 210, g = 180, b = 160 }
-------------------------------------------------------------------------------- Grass orange
tintD[ 'sand-decal-tan'  ] = { r = 190, g = 140, b = 110 }
tintD[ 'stone-decal-tan' ] = { r = 190, g = 140, b = 110 }
-------------------------------------------------------------------------------- Desert tan
tintD[ 'sand-dune-decal-tan' ] = { r = 170, g = 170, b = 170 }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## BUSHES ################################

tintD[ 'flower-bush-green-yellow' ] = { r = 180, g = 180, b = 180 }
--tintD[   'flower-bush-green-blue' ] = { r = 180, g = 180, b = 180 }






-------------------------------------------------------------------------------- Volcanic
tintD[ 'brown-fluff-dry' ] = { r = 180, g = 180, b = 220 }
tintD[ 'red-desert-bush' ] = { r = 180, g = 160, b = 200 }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## ROCKS #################################

-------------------------------------------------------------------------------- Volcanic
tintD[  'rock-tiny-black'   ] = { r = 110, g = 100, b = 100 }
tintD[  'rock-small-black'  ] = { r = 110, g = 100, b = 100 }
tintD[  'rock-medium-black' ] = { r = 110, g = 100, b = 100 }
tintSE[ 'rock-big-black'    ] = { r = 110, g = 100, b = 100 }
tintSE[ 'rock-huge-black'   ] = { r = 110, g = 100, b = 100 }
--tintD[ 'rock-tiny-volcanic'   ] = { r = 100, g = 90, b = 90 }
--tintD[ 'rock-small-volcanic'  ] = { r = 100, g = 90, b = 90 }
--tintD[ 'rock-medium-volcanic' ] = { r = 100, g = 90, b = 90 }
--tintSE[ 'rock-big-volcanic'   ] = { r =  80, g = 80, b = 80 }
--tintSE[ 'rock-huge-volcanic'  ] = { r =  80, g = 80, b = 80 }
-------------------------------------------------------------------------------- Dirt red
tintD[ 'rock-tiny-red'   ] = { r = 150, g = 115, b =  90 }
tintD[ 'rock-small-red'  ] = { r = 150, g = 115, b =  90 }
tintD[ 'rock-medium-red' ] = { r = 150, g = 115, b =  90 }
tintSE[ 'rock-big-red'   ] = { r = 150, g = 115, b =  90 }
tintSE[ 'rock-huge-red'  ] = { r = 150, g = 115, b =  90 }
-------------------------------------------------------------------------------- Grass orange
tintD[ 'rock-tiny-brown'   ] = { r = 180, g = 130, b = 85 }
tintD[ 'rock-small-brown'  ] = { r = 180, g = 130, b = 85 }
tintD[ 'rock-medium-brown' ] = { r = 180, g = 130, b = 85 }
tintSE[ 'rock-big-brown'   ] = { r = 180, g = 130, b = 85 }
tintSE[ 'rock-huge-brown'  ] = { r = 180, g = 130, b = 85 }
-------------------------------------------------------------------------------- Grass olive
tintD[ 'rock-tiny-beige'   ] = { r = 180, g = 150, b = 95 }
tintD[ 'rock-small-beige'  ] = { r = 180, g = 150, b = 95 }
tintD[ 'rock-medium-beige' ] = { r = 180, g = 150, b = 95 }
tintSE[ 'rock-big-beige'   ] = { r = 180, g = 150, b = 95 }
tintSE[ 'rock-huge-beige'  ] = { r = 180, g = 150, b = 95 }
-------------------------------------------------------------------------------- Desert tan
tintD[ 'sand-rock-small-tan'  ] = { r = 255, g = 210, b = 170 }
tintD[ 'sand-rock-medium-tan' ] = { r = 255, g = 210, b = 170 }
tintSE[ 'sand-rock-big-tan'   ] = { r = 255, g = 210, b = 170 }
--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## TREES #################################

-------------------------------------------------------------------------------- Volcanic
-- Medusa tree
tintF[ 'tree-volcanic-a' ] = {}
tintF[ 'tree-volcanic-a' ].leaves = { r = 200, g = 200, b = 255 }
tintF[ 'tree-volcanic-a' ].trunk  = { r = 100, g = 120, b = 120 }
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--############################################################################## APPLYING TINT #########################

for name, color in pairs( tintD ) do
    local decal = data.raw[ 'optimized-decorative' ][ name ]
    for _, v_pic in pairs( decal.pictures ) do
        v_pic.tint = color
        if v_pic.hr_version then
            v_pic.hr_version.tint = color
        end
    end
end

for name, color in pairs( tintSE ) do
    local rock = data.raw[ 'simple-entity' ][ name ]
    for _, v_pic in pairs ( rock.pictures ) do
        v_pic.tint = color
        if v_pic.hr_version then
            v_pic.hr_version.tint = color
        end
    end
end

for name, color in pairs( tintF ) do
    local tree = data.raw.tree[ name ]
    for _, v_var in pairs ( tree.variations ) do
        local leavesColor = tintF[ name ].leaves
        v_var.leaves.tint = leavesColor
        if v_var.leaves.hr_version then
            v_var.leaves.hr_version.tint = leavesColor
        end
        local trunkColor = tintF[ name ].trunk
        v_var.trunk.tint = trunkColor
        if v_var.trunk.hr_version then
           v_var.trunk.hr_version.tint = trunkColor
        end
    end
end

--______________________________________________________________________________________________________________________
--######################################################################################################################
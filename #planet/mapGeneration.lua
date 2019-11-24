local _mapGeneration = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--****************************************************************************** Map generation settings override
-- https://wiki.factorio.com/Types/MapGenPreset#autoplace_controls
function _mapGeneration.init()
    local nauvis   = game.surfaces[ 'nauvis' ]
    local settings = nauvis.map_gen_settings

-- Resources -------------------------------------------------------------------

    settings.autoplace_controls[ 'stone'       ].frequency = 0.00
    settings.autoplace_controls[ 'stone'       ].size      = 0.00
    settings.autoplace_controls[ 'stone'       ].richness  = 0.00

    settings.autoplace_controls[ 'coal'        ].frequency = 0.00
    settings.autoplace_controls[ 'coal'        ].size      = 0.00
    settings.autoplace_controls[ 'coal'        ].richness  = 0.00

    settings.autoplace_controls[ 'copper-ore'  ].frequency = 0.00
    settings.autoplace_controls[ 'copper-ore'  ].size      = 0.00
    settings.autoplace_controls[ 'copper-ore'  ].richness  = 0.00

    settings.autoplace_controls[ 'iron-ore'    ].frequency = 0.00
    settings.autoplace_controls[ 'iron-ore'    ].size      = 0.00
    settings.autoplace_controls[ 'iron-ore'    ].richness  = 0.00

    settings.autoplace_controls[ 'uranium-ore' ].frequency = 0.00
    settings.autoplace_controls[ 'uranium-ore' ].size      = 0.00
    settings.autoplace_controls[ 'uranium-ore' ].richness  = 0.00

    settings.autoplace_controls[ 'crude-oil'   ].frequency = 0.00
    settings.autoplace_controls[ 'crude-oil'   ].size      = 0.00
    settings.autoplace_controls[ 'crude-oil'   ].richness  = 0.00

-- Landscape -------------------------------------------------------------------

    settings.property_expression_names[ 'control-setting:moisture:frequency:multiplier' ] =  1.00
    settings.property_expression_names[ 'control-setting:moisture:bias'                 ] =  0.00
    settings.property_expression_names[ 'control-setting:aux:frequency:multiplier'      ] =  1.00
    settings.property_expression_names[ 'control-setting:aux:bias'                      ] = -0.50

    settings.autoplace_controls[ 'cold'  ].size      = 0.00

    settings.autoplace_controls[ 'hot'   ].frequency = 1.00
    settings.autoplace_controls[ 'hot'   ].size      = 1.00
    settings.autoplace_controls[ 'hot'   ].richness  = 1.00

    settings.autoplace_controls[ 'trees' ].frequency = 1.00
    settings.autoplace_controls[ 'trees' ].size      = 1.00
    settings.autoplace_controls[ 'trees' ].richness  = 1.00

-- Enemies ---------------------------------------------------------------------

    settings.autoplace_controls[ 'enemy-base' ].frequency = 0.00
    settings.autoplace_controls[ 'enemy-base' ].size      = 0.00
    settings.autoplace_controls[ 'enemy-base' ].richness  = 0.00

    settings.peaceful_mode = false

-- Starting area ---------------------------------------------------------------

    settings.starting_area = 1

-- -----------------------------------------------------------------------------

    nauvis.map_gen_settings = settings

    for k, v in pairs(nauvis.map_gen_settings.property_expression_names) do
        log( '>> ' .. k )
    end

end

--******************************************************************************

return _mapGeneration




--[[ nauvis.map_gen_settings
     >>> terrain_segmentation
     >>> water
     >>> autoplace_controls
     >>> autoplace_settings
     >>> property_expression_names
     >>> starting_points
     >>> seed
     >>> width
     >>> height
     >>> starting_area
     >>> peaceful_mode
     >>> cliff_settings]]
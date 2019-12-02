-- See https://wiki.factorio.com/Types/MapGenPreset#autoplace_controls
local config = {}

    config.autoplace_controls        = {}
    config.property_expression_names = {}

-- Resources -------------------------------------------------------------------

    config.autoplace_controls[ 'stone'       ] = {}
    config.autoplace_controls[ 'stone'       ].frequency = 0.00
    config.autoplace_controls[ 'stone'       ].size      = 0.00
    config.autoplace_controls[ 'stone'       ].richness  = 0.00

    config.autoplace_controls[ 'coal'        ] = {}
    config.autoplace_controls[ 'coal'        ].frequency = 0.00
    config.autoplace_controls[ 'coal'        ].size      = 0.00
    config.autoplace_controls[ 'coal'        ].richness  = 0.00

    config.autoplace_controls[ 'copper-ore'  ] = {}
    config.autoplace_controls[ 'copper-ore'  ].frequency = 0.00
    config.autoplace_controls[ 'copper-ore'  ].size      = 0.00
    config.autoplace_controls[ 'copper-ore'  ].richness  = 0.00

    config.autoplace_controls[ 'iron-ore'    ] = {}
    config.autoplace_controls[ 'iron-ore'    ].frequency = 0.00
    config.autoplace_controls[ 'iron-ore'    ].size      = 0.00
    config.autoplace_controls[ 'iron-ore'    ].richness  = 0.00

    config.autoplace_controls[ 'uranium-ore' ] = {}
    config.autoplace_controls[ 'uranium-ore' ].frequency = 0.00
    config.autoplace_controls[ 'uranium-ore' ].size      = 0.00
    config.autoplace_controls[ 'uranium-ore' ].richness  = 0.00

    config.autoplace_controls[ 'crude-oil'   ] = {}
    config.autoplace_controls[ 'crude-oil'   ].frequency = 0.00
    config.autoplace_controls[ 'crude-oil'   ].size      = 0.00
    config.autoplace_controls[ 'crude-oil'   ].richness  = 0.00

-- Landscape -------------------------------------------------------------------

    config.property_expression_names[ 'control-setting:moisture:frequency:multiplier' ] =  6.00
    config.property_expression_names[ 'control-setting:moisture:bias'                 ] =  0.00
    config.property_expression_names[ 'control-setting:aux:frequency:multiplier'      ] =  6.00
    config.property_expression_names[ 'control-setting:aux:bias'                      ] = -0.50

    config.autoplace_controls[ 'hot'   ] = {}
    config.autoplace_controls[ 'hot'   ].frequency  = 1.00
    config.autoplace_controls[ 'hot'   ].size       = 0.50
    config.autoplace_controls[ 'hot'   ].richness   = 1.00

    config.autoplace_controls[ 'cold'  ] = {}
    config.autoplace_controls[ 'cold'  ].frequency = 1.00
    config.autoplace_controls[ 'cold'  ].size      = 0.00
    config.autoplace_controls[ 'cold'  ].richness  = 1.00

    config.autoplace_controls[ 'trees' ] = {}
    config.autoplace_controls[ 'trees' ].frequency  = 1.00
    config.autoplace_controls[ 'trees' ].size       = 1.00
    config.autoplace_controls[ 'trees' ].richness   = 1.00

-- Enemies ---------------------------------------------------------------------

    config.autoplace_controls[ 'enemy-base' ] = {}
    config.autoplace_controls[ 'enemy-base' ].frequency = 0.00
    config.autoplace_controls[ 'enemy-base' ].size      = 0.00
    config.autoplace_controls[ 'enemy-base' ].richness  = 0.00

    config.peaceful_mode = false

-- Starting area ---------------------------------------------------------------

    config.starting_area = 1

-- -----------------------------------------------------------------------------

return config
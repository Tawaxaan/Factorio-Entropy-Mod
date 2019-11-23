-------------------------------------------------------------------------require
require( 'hotkeys' )

require( '#terrain/_data'  )
require( '#entities/_data' )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


require ("util")


--______________________________________________________________________________________________________________________
--############################################################################## WORLD GENERATION PRESET ###############

data.raw[ 'map-gen-presets' ][ 'default' ][ 'entropy' ] = {
    order = '1',
        basic_settings = {
            property_expression_names = {},
            autoplace_controls = {
                [ 'stone'       ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
                [ 'coal'        ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
                [ 'copper-ore'  ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
                [ 'iron-ore'    ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
                [ 'crude-oil'   ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
                [ 'uranium-ore' ] = { frequency = 1.00, size = 1.00, richness = 1.00 },

                [ 'enemy-base'  ] = { frequency = 1.00, size = 1.00, richness = 1.00 },
            },

            starting_area = 1.00,
            --water = 0.00,
        },
    advanced_settings = {
        difficulty_settings = {
            recipe_difficulty     = defines.difficulty_settings.recipe_difficulty.expensive,
            technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
        },
    },
    enemy_evolution = {
        time_factor      = 0.0000000,
        pollution_factor = 0.0000000,
    },
}

--TODO: Turn off COLD CLIMATES !!!

local propertyExpressionNames = {}
propertyExpressionNames[ 'control-setting:moisture:scale' ] =  1.00
propertyExpressionNames[ 'control-setting:moisture:bias'  ] =  0.00
propertyExpressionNames[ 'control-setting:aux:scale'      ] =  1.00
propertyExpressionNames[ 'control-setting:aux:bias'       ] = -0.50
data.raw[ 'map-gen-presets' ].default[ 'entropy' ].basic_settings.property_expression_names = propertyExpressionNames

--local cliffSettings = {}
--cliffSettings.name = 'cliff'
--cliffSettings.cliff_elevation_interval = 0
--cliffSettings.richness                 = 1.00
--data.raw[ 'map-gen-presets' ].default[ 'entropy' ].basic_settings.cliff_settings = cliffSettings

--######################################################################################################################
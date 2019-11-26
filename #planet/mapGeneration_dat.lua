-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
local config = require( '#planet/mapGeneration_cfg' )
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## WORLD GENERATION PRESET ###############

-- Remove vanila world map generation presets ----------------------------------

data.raw[ 'map-gen-presets' ][ 'default' ][ 'rich-resources'        ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'marathon'              ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'death-world'           ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'death-world-marathon'  ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'rail-world'            ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'ribbon-world'          ] = nil
data.raw[ 'map-gen-presets' ][ 'default' ][ 'island'                ] = nil

-- Entropy world preset --------------------------------------------------------

data.raw[ 'map-gen-presets' ][ 'default' ][ 'entropy' ] = {
    order = 'b',
        basic_settings = {
            property_expression_names = config.property_expression_names,
            autoplace_controls        = config.autoplace_controls,
            starting_area             = config.starting_area,
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

-- -----------------------------------------------------------------------------

--______________________________________________________________________________________________________________________
--######################################################################################################################

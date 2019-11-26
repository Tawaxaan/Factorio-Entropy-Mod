local _mapGeneration = {}
-------------------------------------------------------------------------require
--------------------------------------------------------------------------config
local config = require( '#planet/mapGeneration_cfg' )
---------------------------------------------------------------------------local


--****************************************************************************** Map generation settings override
function _mapGeneration.init()
    local nauvis   = game.surfaces[ 'nauvis' ]
    local settings = nauvis.map_gen_settings

    for k, v in pairs( config.autoplace_controls ) do
        settings.autoplace_controls[ k ] = v
    end

    for k, v in pairs( config.property_expression_names ) do
        settings.property_expression_names[ k ] = v
    end

    settings.peaceful_mode = config.peaceful_mode
    settings.starting_area = config.starting_area

    nauvis.map_gen_settings = settings
end

--******************************************************************************

return _mapGeneration
local settings = require( "settings" )

require( "code._common.log" )

local _common   = require( "code._common.generic"    )
local _forest   = require( "code.terrain.forest"     )
local _inserter = require( "code.functions.inserter" )

--------------------------------------------------------------------------------
local DAY_LENGTH = 24 -- Length of day (real minutes)
--------------------------------------------------------------------------------


--______________________________________________________________________________________________________________________
--############################################################################## FOREST PROCESSING #####################

--****************************************************************************** Chunks processing iteration interval
script.on_nth_tick( _forest.PROCESS_INTERVAL, function( event )
    _forest.process()
end)


--______________________________________________________________________________________________________________________
--############################################################################## INSERTERS #############################

--****************************************************************************** Drop-off point swap event
script.on_event( "fe_inserter-dropoff-point-swap", function( event )
    local player = game.players[ event.player_index ]
    if player.selected and player.selected.type == "inserter" then
        if player.can_reach_entity( player.selected ) then
            _inserter.dropoff_point_swap( player.selected )
        else
            _common.player_cannot_reach( player, player.selected )
        end
    end
end)


--______________________________________________________________________________________________________________________
--############################################################################## GERERIC ENGINE EVENTS #################

script.on_init( function()
    _debug( "Entropy started", true )
    _log(   "Entropy started", true )
    -- Daytime length adjusting
    game.surfaces[ 1 ].ticks_per_day = DAY_LENGTH * 60 * 60
end)


--######################################################################################################################
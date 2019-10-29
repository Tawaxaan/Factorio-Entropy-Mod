-------------------------------------------------------------------------require
local _common   = require( 'common.generic'      )

local _weather  = require( '#planet/weather'     )
local _forest   = require( "#terrain/forest"     )
local _inserter = require( '#entities/inserters' )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## GERERIC ENGINE EVENTS #################

--****************************************************************************** Script on-init
script.on_init( function()
    _weather.set_daytime_length()
end)

--******************************************************************************

--______________________________________________________________________________________________________________________
--############################################################################## HOTKEYS EVENTS ########################

--****************************************************************************** Drop-off point swap event
script.on_event( "entropy-inserter-dropoff-point-swap", function( event )
    local player = game.players[ event.player_index ]
    if player.selected and player.selected.type == "inserter" then
        if player.can_reach_entity( player.selected ) then
            _inserter.dropoff_point_swap( player.selected )
        else
            _common.player_cannot_reach_notification( player, player.selected )
        end
    end
end)

--****************************************************************************** Drop-off rotate event
script.on_event( "entropy-inserter-dropoff-rotate", function( event )
    local player = game.players[ event.player_index ]
    if player.selected and player.selected.type == "inserter" then
        if player.can_reach_entity( player.selected ) then
            _inserter.dropoff_rotate( player.selected )
        else
            _common.player_cannot_reach_notification( player, player.selected )
        end
    end
end)

--******************************************************************************

--______________________________________________________________________________________________________________________
--############################################################################## FOREST PROCESSING #####################

--****************************************************************************** Chunks count calculating event
script.on_nth_tick( _forest.cfg.CHUNKS_COUNT_UPDATE_INTERVAL*3600, function( event )
    _forest.calc_chunks_count()
end)

--****************************************************************************** Chunks processing iteration event
script.on_nth_tick( _forest.cfg.PROCESS_INTERVAL, function( event )
    _forest.process()
end)

--******************************************************************************

--######################################################################################################################
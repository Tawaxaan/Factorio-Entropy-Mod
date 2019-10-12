local settings = require( "settings" )

local math   = require( "code.common.math"  )
local common = require( "code.common.other" )

--______________________________________________________________________________________________________________________
--############################################################################## DAYTIME AJUST #########################

-- Length of day (in real minutes).
local day_length = 24

script.on_init( function()
    game.surfaces[ 1 ].ticks_per_day = day_length * 60 * 60
end)

--______________________________________________________________________________________________________________________
--############################################################################## INSERTER DROP-OFF POINT ADJUST ########


--****************************************************************************** Drop-off point adjusting
local function adjust_inserter_dropoff_point( inserter )
    local pos_type   = "drop_position"
    local pos_target = math.vector_diff( inserter[ pos_type ], inserter.position )
    local dist       = string.find( inserter.name, "long%-handed" ) and 2 or 1
    local vec_offset = { x = 0, y = 0 }

    if     pos_target.x > 0 then vec_offset.x = ( pos_target.x >  dist and -0.5 or  0.5 )
    elseif pos_target.x < 0 then vec_offset.x = ( pos_target.x < -dist and  0.5 or -0.5 )
    elseif pos_target.y > 0 then vec_offset.y = ( pos_target.y >  dist and -0.5 or  0.5 )
    elseif pos_target.y < 0 then vec_offset.y = ( pos_target.y < -dist and  0.5 or -0.5 )
    end

    inserter[pos_type] = math.vector_sum( inserter[pos_type], vec_offset )
end

--****************************************************************************** Drop-off point adjust event
script.on_event( "fe_inserter-dropoff-point", function( event )
    local player = game.players[ event.player_index ]
    if player.selected and player.selected.type == "inserter" then
        if player.can_reach_entity( player.selected ) then
            adjust_inserter_dropoff_point( player.selected )
        else
            common.player_cannot_reach( player, player.selected )
        end
    end
end)

--######################################################################################################################
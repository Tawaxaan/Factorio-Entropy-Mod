local _inserter = {}
-------------------------------------------------------------------------require
local _math = require( 'common/math' )
--------------------------------------------------------------------------config
---------------------------------------------------------------------------local


--______________________________________________________________________________________________________________________
--############################################################################## CONTROL FUNCTIONS #####################

--****************************************************************************** Drop-off point swap
function _inserter.dropoff_point_swap( inserter )
    local pos_type = 'drop_position'
    local drop_pos = _math.vector_diff( inserter[ pos_type ], inserter.position )
    local dist     = string.find( inserter.name, 'long%-handed' ) and 2 or 1
    local offset   = { x = 0, y = 0 }

    if     drop_pos.x > 0 then offset.x = ( drop_pos.x >  dist and -0.5 or  0.5 )
    elseif drop_pos.x < 0 then offset.x = ( drop_pos.x < -dist and  0.5 or -0.5 )
    elseif drop_pos.y > 0 then offset.y = ( drop_pos.y >  dist and -0.5 or  0.5 )
    elseif drop_pos.y < 0 then offset.y = ( drop_pos.y < -dist and  0.5 or -0.5 )
    end
    drop_pos = _math.vector_sum( drop_pos, offset )

    inserter[ pos_type ] = drop_pos
end

--****************************************************************************** Drop-off rotate
function _inserter.dropoff_rotate( inserter )
    local pos_type = 'drop_position'
    local drop_pos = _math.vector_diff( inserter[ pos_type          ], inserter.position )
    local pick_pos = _math.vector_diff( inserter[ 'pickup_position' ], inserter.position )
    local offset   = { x = 0, y = 0 }

    local diff
    repeat
        if     drop_pos.x > 0 then offset = { x = -drop_pos.x, y =  drop_pos.x }
        elseif drop_pos.x < 0 then offset = { x = -drop_pos.x, y =  drop_pos.x }
        elseif drop_pos.y > 0 then offset = { x = -drop_pos.y, y = -drop_pos.y }
        elseif drop_pos.y < 0 then offset = { x = -drop_pos.y, y = -drop_pos.y }
        end
        drop_pos = _math.vector_sum(  drop_pos, offset   )
        diff     = _math.vector_diff( drop_pos, pick_pos )
    until diff.x > 0.5 or diff.y > 0.5

    inserter[ pos_type ] = _math.vector_sum( inserter.position, drop_pos )
end

--******************************************************************************

--######################################################################################################################

return _inserter
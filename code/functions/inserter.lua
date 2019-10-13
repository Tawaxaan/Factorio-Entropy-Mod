local _math = require( "code.common.math"   )

local _inserter = {}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--****************************************************************************** Drop-off point swap
function _inserter.dropoff_point_swap( inserter )
    local pos_type   = "drop_position"
    local target_pos = _math.vector_diff( inserter[ pos_type ], inserter.position )
    local dist       = string.find( inserter.name, "long%-handed" ) and 2 or 1
    local offset     = { x = 0, y = 0 }

    if     target_pos.x > 0 then offset.x = ( target_pos.x >  dist and -0.5 or  0.5 )
    elseif target_pos.x < 0 then offset.x = ( target_pos.x < -dist and  0.5 or -0.5 )
    elseif target_pos.y > 0 then offset.y = ( target_pos.y >  dist and -0.5 or  0.5 )
    elseif target_pos.y < 0 then offset.y = ( target_pos.y < -dist and  0.5 or -0.5 )
    end

    inserter[ pos_type ] = _math.vector_sum( inserter[ pos_type ], offset )
end

--******************************************************************************

return _inserter
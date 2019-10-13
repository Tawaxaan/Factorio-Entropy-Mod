--------------------------------------------------------------------------------
local DEBUG_ENABLED = true
--------------------------------------------------------------------------------

--****************************************************************************** Write log to file
function _debug( str, clear_log )
    if not DEBUG_ENABLED then return end
    game.write_file( "entropy_debag.log", "\n" .. str, not clear_log )
end

function _log( str, clear_log )
	game.write_file( "entropy.log"      , "\n" .. str, not clear_log )
end

--******************************************************************************
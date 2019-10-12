local common = {}

--______________________________________________________________________________________________________________________
--############################################################################## VARIOUS COMMON FUNCTIONS ##############


--****************************************************************************** Player cannot reach warning
function common.player_cannot_reach( player, entity )
    player.play_sound{ path = "utility/cannot_build" }
    player.create_local_flying_text{ text = { "cant-reach" }, position = entity.position }
end


--######################################################################################################################

return common
function _log( str, newFile )
	game.write_file( "entropy.log", "\n"..str, not newFile )
end
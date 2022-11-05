#!/usr/bin/osascript

on isRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end isRunning

on isPlaying(appName)
	if isRunning(appName) then
		using terms from application "Music"
			tell application appName
				return player state is playing
			end tell
		end using terms from
	end if
	return false
end isPlaying

on Playing()
	if isPlaying("Music") then
		set appName to "Music"
	else
		if isPlaying("Spotify") then
			set appName to "Spotify"
		else
			return ""
		end if
	end if
	using terms from application "Music"
		tell application appName
			set songName to the name of the current track
			set songArtist to the artist of the current track
			return songName + "  " + songArtist
		end tell
	end using terms from
end Playing

return Playing()

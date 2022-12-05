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

on isPaused(appName)
	if isRunning(appName) then
		using terms from application "Music"
			tell application appName
				return player state is paused
			end tell
		end using terms from
	end if
	return false
end isPaused

on getCurrentMusicApp()
	if isPlaying("Music") then
		return "Music"
	else if isPlaying("Spotify") then
		return "Spotify"
	else if isPaused("Music") then
		return "Music"
	else if isPaused("Spotify") then
		return "Spotify"
	end if
end getCurrentMusicApp()

on run argv
	return "hello, " & item 1 of argv & "."
end run

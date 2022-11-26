#!/usr/bin/osascript

on isRunning(appName)
	return application appName is running
end isRunning

on isHebrew(theText)
	set hebrewLetters to (every character of "-_()[]{},./=1234567890 אבגדהוזחטיכלמנסעפצקרשת")
	repeat with theCharacter in (every character of theText)
		if hebrewLetters does not contain theCharacter then
			return false
		end if
	end repeat
	return true
end isHebrew

on fixText(theText)
	if isHebrew(theText) then
		set theText to reverse of theText's items as text
	end if
	return theText
end fixText


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
			return "♪"
		end if
	end if
	using terms from application "Music"
		tell application appName
			set songName to the name of the current track
			set songArtist to the artist of the current track
		end tell
		set songName to fixText(songName)
		set songArtist to fixText(songArtist)
		set result to (songName & "  " & songArtist)
		return result
	end using terms from
end Playing

return Playing()


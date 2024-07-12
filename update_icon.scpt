

on zero_pad(value, string_length)
	set string_zeroes to ""
	set digits_to_pad to string_length - (length of (value as string))
	if digits_to_pad > 0 then
		repeat digits_to_pad times
			set string_zeroes to string_zeroes & "0" as string
		end repeat
	end if
	set padded_value to string_zeroes & value as string
	return padded_value
end zero_pad

set now to (current date)
set result to ("/Users/morrykolman/rand_git/desktop_clock/") as string
set result to result & zero_pad(hours of now mod 12 as integer, 2)
set result to result & "_"
set result to result & zero_pad(minutes of now as integer, 2)
set result to result & ".icns"


use framework "Foundation"
use scripting additions

-- get source file (that is, original item)
set sourceFile to ("/Users/morrykolman/Desktop/clock")

-- indicate custom icon's Posix payh
set iconFile to result

-- change icon of the original (source) file
set theImage to current application's NSImage's alloc()'s initWithContentsOfFile:iconFile
set ws to current application's NSWorkspace's sharedWorkspace()
ws's setIcon:theImage forFile:(POSIX path of sourceFile) options:0

-- make Finder alias file on desktop
tell application "Finder" to set aliasRef to (make new alias file at desktop to sourceFile) as text

delay 2 -- required (test other delay values)

-- remove original file's custom icon (that is, restore to defaults icon)
ws's setIcon:(missing value) forFile:(POSIX path of sourceFile) options:0

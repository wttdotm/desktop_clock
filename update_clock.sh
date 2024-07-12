# NOW_HOUR=$( date +"%H" )
# echo $NOW_HOUR
# NOW_MINUTE=$( date +"%M")
# NOW_HOUR_NORMALIZED=$(($NOW_HOUR % 12))
# HOUR_LENGTH=${#NOW_HOUR_NORMALIZED}
# echo "${NOW_HOUR}_${HOUR_LENGTH}"
# if (( 2 > HOUR_LENGTH )); then
#     echo "this hour is too short"
#     FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/0${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
#     fileicon set /Users/morrykolman/Desktop/clock $FILE_PATH
# else
#     FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
#     fileicon set /Users/morrykolman/Desktop/clock $FILE_PATH
# fi
# osascript <<EOD
# tell application "Finder"
#     -- Open a new Finder window to the Desktop folder
#     set desktopFolder to (POSIX file "/Users/morrykolman/Desktop") as alias
#     set newWindow to (make new Finder window to desktopFolder)
    
#     -- Resize the window to 1x1 pixels
#     set bounds of newWindow to {0, 0, 300, 300}

#     -- Close the window
#     close newWindow
# end tell
# display dialog "this also ran"
# EOD

NOW_HOUR=$( date +"%H" )
echo $NOW_HOUR
NOW_MINUTE=$( date +"%M")
NOW_HOUR_NORMALIZED=$(($NOW_HOUR % 12))
HOUR_LENGTH=${#NOW_HOUR_NORMALIZED}
echo "${NOW_HOUR}_${HOUR_LENGTH}"
if (( 2 > HOUR_LENGTH )); then
    echo "this hour is too short"
    FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/0${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
    fileicon set /Users/morrykolman/Desktop/clockIcon $FILE_PATH
else
    FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
    fileicon set /Users/morrykolman/Desktop/clockIcon $FILE_PATH
fi

# Force Finder to refresh the desktop icon
# osascript <<EOF
# tell application "Finder"
#     set desktopFolder to path to desktop folder as alias
#     set theFile to item "clockIcon" of desktopFolder
#     set theFile to theFile as alias
#     update theFile
# end tell
# EOF

touch "/Users/morrykolman/Desktop/${NOW_HOUR}_${NOW_MINUTE}_holder"
# touch "/Users/morrykolman/Desktop/clockIcon"
# fileicon set /Users/morrykolman/Desktop/clockIcon $FILE_PATH
rm "/Users/morrykolman/Desktop/${NOW_MINUTE}_holder"
# osascript <<EOD
# display dialog "this also ran"
# EOD
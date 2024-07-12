#!/bin/bash

# Copy the file to the Desktop
cp /Users/morrykolman/rand_git/desktop_clock/all_clocks/03_30.png ~/Desktop/

# AppleScript to move the file to specific coordinates
osascript <<EOF
tell application "Finder"
    set desktopFolder to path to desktop folder as alias
    set theFile to item "03_30.png" of desktopFolder
    set position of theFile to {500, 500}
end tell
EOF

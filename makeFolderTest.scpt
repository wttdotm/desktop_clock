tell application "Finder"
    -- Create a new folder on the desktop
    set newFolder to make new folder at desktop with properties {name:"test"}

    -- Move the folder to the specified position
    set the position of newFolder to {500, 500}
end tell
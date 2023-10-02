#!/bin/bash
DIR_DOCKLIGHT="pathtodocklightinstallationfolder/Docklight_Scripting.exe"
DIR_SCRIPT="pathtotestfolder/RS485Test.pts"
title="RS485 TEST"

cd
xdotool key ctrl+alt+t
xdotool type "wine $DIR_DOCKLIGHT -r $DIR_SCRIPT"
xdotool key Return
sleep 5 # Thsi delay must be adjusted to response speed of wine 
xdotool key ctrl+shift+t
xdotool type "Powershell.exe -ExecutionPolicy Bypass -File \"$PWD/voicestart.ps1\""
xdotool key Return

while true; do
    FC _error_log.txt Texto1.txt >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        break
    fi
    echo ""
    read -p "Press Enter to continue..."
done

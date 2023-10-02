#!/bin/bash
PROD_ID="EXAMPLE MODEM EHS6"
CLIENT_ID="Modem Under Process"
FOLDER="whereveritis/FirmFolder"
DLFOLDER="whereveritis/Docklight_Scripting.exe"
DLSCRIPT="whereveritis/ChangeVersion.pts"

# Function to check if a device is available on COM12 port
check_device_availability() {
    while true; do
        if timeout 1s cat < /dev/ttyS11; then
            return 0  # Device found
        else
            echo "Searching modem..."
            sleep 2
        fi
    done
}

# Function to load firmware and handle errors
load_firmware() {
    while true; do
        wine MESXCopy.exe "$FOLDER" "mod:A:/FirmFolder"
        if [ $? -eq 0 ]; then
            echo "Folder load finished!"
            return 0  # Success
        else
            echo "Error!!!"
            read -p "Press Enter to retry..."
        fi
    done
}

clear
echo "$CLIENT_ID"
echo "$PROD_ID"
echo "Searching for modem..."
check_device_availability

while true; do
    clear
    echo "$CLIENT_ID"
    echo "$PROD_ID"
    echo "Loading firmware..."
    load_firmware

    echo "Ready!"
    echo "Modem ready!"
    
    # Launch Docklight here if needed
    # wine "$DLFOLDER" -r "$DLSCRIPT"
    
    echo "Waiting for Port12 to be disconnected..."
    while timeout 1s cat < /dev/ttyS11; do
        sleep 1
    done
    
    echo "Port12 disconnected."
done

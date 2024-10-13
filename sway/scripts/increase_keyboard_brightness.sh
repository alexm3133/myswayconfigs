#!/bin/bash

# Path to the brightness file
BRIGHTNESS_FILE="/sys/class/leds/kbd_backlight/brightness"

# Read the current brightness value
CURRENT_BRIGHTNESS=$(cat $BRIGHTNESS_FILE)

# Calculate new brightness
NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS + 15))

# Max brightness value
MAX_BRIGHTNESS=255
if [ "$NEW_BRIGHTNESS" -gt "$MAX_BRIGHTNESS" ]; then
    NEW_BRIGHTNESS=$MAX_BRIGHTNESS
fi

# Set the new brightness
echo $NEW_BRIGHTNESS | sudo tee $BRIGHTNESS_FILE > /dev/null


#!/bin/bash

# Path to the brightness file
BRIGHTNESS_FILE="/sys/class/leds/kbd_backlight/brightness"

# Read the current brightness value
CURRENT_BRIGHTNESS=$(cat $BRIGHTNESS_FILE)

# Calculate new brightness
NEW_BRIGHTNESS=$((CURRENT_BRIGHTNESS - 15))

# Prevent negative brightness value
if [ "$NEW_BRIGHTNESS" -lt 0 ]; then
    NEW_BRIGHTNESS=0
fi

# Set the new brightness
echo $NEW_BRIGHTNESS | sudo tee $BRIGHTNESS_FILE


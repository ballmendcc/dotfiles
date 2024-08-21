#!/bin/bash

# Check if Alacritty is already running and is focused
if wmctrl -lx | grep -q "Alacritty.Alacritty"; then
    # Get the window ID of the Alacritty instance
    alacritty_window_id=$(wmctrl -lx | grep "Alacritty.Alacritty" | awk '{print $1}')

    # Check if the Alacritty window is currently active
    active_window_id=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | awk '{print $5}')

    if [ "$alacritty_window_id" == "$active_window_id" ]; then
        # If the Alacritty window is active, minimize it
        wmctrl -ir "$alacritty_window_id" -b add,hidden
    else
        # If the Alacritty window is not active, bring it to the foreground
        wmctrl -ia "$alacritty_window_id"
    fi
else
    # If no Alacritty window is found, launch a new one
    alacritty &
fi

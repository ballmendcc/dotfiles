#!/bin/bash

# Check if the correct number of arguments is passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <workspace_number>"
    exit 1
fi

# Get the ID of the active window
active_window_id=$(xdotool getactivewindow)

# Directly use the workspace number argument as it is 1-indexed
workspace_number=$1

# Move the active window to the specified workspace
wmctrl -i -r "$active_window_id" -t $workspace_number

#!/usr/bin/env bash

# Function to add alpha to hex colors
add_alpha() {
    # $1 is the alpha value (00 to ff), $2 is the color in hex (e.g., #ffffff)
    # Output the color in the format #alpha_color
    echo "#$2${1:1}"
}

# Source the pywal color definitions
source "${HOME}/.cache/wal/colors.sh"

# Set the alpha value (change 'aa' to your desired transparency level)
BG=$(add_alpha $background 'cc')

# Export the colors to be used in the Polybar config
export BG

# Launch Polybar
polybar-msg cmd quit 
add_alpha $background 'a6'
polybar zefe 2>&1 | tee -a /tmp/polybar.log & disown


#!/bin/bash
# This script converts pywal's color definitions into Polybar format

# Source the pywal color definitions
source "${HOME}/.cache/wal/colors.sh"

# Create or overwrite the Polybar colors file
cat > "${HOME}/.config/polybar/colors.ini" <<EOF
; Auto-generated color file
[colors]
background = $background
foreground = $foreground
disabled = $color0
primary = $color1
secondary = $color2
background-alt = $color3
alert = $color4
color5 = $color5
color6 = $color6
color7 = $color7
color8 = $color8
color9 = $color9
color10 = $color10
color11 = $color11
color12 = $color12
color13 = $color13
color14 = $color14
color15 = $color15
EOF

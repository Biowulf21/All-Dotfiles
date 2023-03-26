#!/bin/bash

# Get the selected item in rofi
selected=$(~/clipster/clipster -o -n 20 | /usr/bin/rofi -dmenu)

# Copy the selected item to the clipboard
echo -n "$selected" | xclip -selection clipboard

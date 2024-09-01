#!/bin/bash

# Check the number of connected monitors
monitor_count=$(xrandr --listmonitors | grep "Monitors:" | awk '{print $2}')
echo "Monitor count: $monitor_count"

# If there are exactly 2 monitors, turn off the eDP-1 monitor
if [ "$monitor_count" -eq 2 ]; then
	echo "Turning off eDP-1 monitor"
	xrandr --output eDP-1 --off
fi

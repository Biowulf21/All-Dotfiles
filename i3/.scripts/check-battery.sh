#!/bin/bash

displayDunst() {
	XDG_RUNTIME_DIR=/run/user/${id-u} dunstify "$1" "$2"
	paplay ~/.scripts/i3-battery-popup.wav
}

enablePowerSaving() {
	brightness="15%"
	brightnessctl set $brightness
}

Batt_Percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}' | tr -d '%')

if [[ $Batt_Percent -le 50 ]]; then
	displayDunst "BATTERY GETTING LOW" "Battery is getting low. You might want to keep a charger nearby."
if [[ $Batt_Percent -le 20 ]]; then
	displayDunst "LOW BATTERY" "Please plug in your charger."
	enablePowerSaving
elif [[ $Batt_Percent -le 10 ]]; then
	displayDunst "VERY LOW BATTERY" "Please plug in your charger."
	enablePowerSaving
elif [[ $Batt_Percent -le 5 ]]; then
	displayDunst "EXTREMELY LOW BATTERY" "Please plug in your charger."
	enablePowerSaving
fi

#! /bin/bash

chosen=$(printf "Shutdown\nReboot\nLogout\nLock" | rofi -dmenu -p "Power Menu:")

case "$chosen" in
"Shutdown")
	shutdown now
	;;
"Restart")
	reboot
	;;
"Logout")
	i3-msg exit
	;;
"Lock")
	i3lock
	;;
*) exit 1 ;;
esac

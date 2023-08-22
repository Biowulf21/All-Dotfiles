#!/bin/bash

# Enable compton's fade-in effect so that the lockscreen gets a nice fade-in
# effect.
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
	com.github.chjj.compton.opts_set string:no_fading_openclose boolean:false

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst

# Capture errors in a variable
BLANK='#00000000'
WHITE='#ffffff'
CLEAR='#ffffff22'
KANAGAWA_BLUE='#7E9CD8'
BG='#282A2E'
DEFAULT='#252535'
WRONG='#880000bb'
VERIFYING='#FF9E3B'
SPRING_GREEN='#98BB6C'

errors=$(
	i3lock -n -i /home/biowulf21/Wallpapers/Gundam/gundam.jpg \
		--insidever-color=$CLEAR \
		--ringver-color=$VERIFYING \
		\
		--insidewrong-color=$CLEAR \
		--ringwrong-color=$WRONG \
		\
		--inside-color=$CLEAR \
		--ring-color=$BG \
		--line-color=$BLANK \
		--separator-color=$DEFAULT \
		\
		--verif-color=$DEFAULT \
		--wrong-color=$WHITE \
		--time-color=$WHITE \
		--date-color=$WHITE \
		--layout-color=$WHITE \
		--keyhl-color=$KANAGAWA_BLUE \
		--bshl-color=$SPRING_GREEN \
		\
		--screen 1 \
		--beep \
		--blur 8 \
		--clock \
		--indicator \
		--ignore-empty-password \
		--show-failed-attempts \
		--time-font="Noto Sans Mono" \
		--time-str="%H:%M:%S" \
		--date-str="%A, %Y-%m-%d" \
		--keylayout 1 \
		2>&1
)

# Display errors using Dunst if they exist
if [ -n "$errors" ]; then
	dunstify -a "Script" -u critical "An error occurred:" "$errors"
fi

# Kill dunst
pkill -u $USER -USR2 dunst

# Revert compton's config changes.
sleep 0.2
dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
	com.github.chjj.compton.opts_set string:no_fading_openclose boolean:true
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:

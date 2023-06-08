# Keyboard layout
# setxkbmap -model pc105 -layout us,ru -option grp:win_space_toggle
setxkbmap -model pc105 -layout us,ru -option grp:alt_shift_toggle,caps:super
# xbindkeys
sxhkd &

# [[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Run slstatus
slstatus &

# Hide the mouse coursor after 3 seconds of inactivity
unclutter -idle 3 &

# run remind daemon and popup notifications
remind -z -k'dunstify -t 0 %s' ~/.reminders/ &

# Start pipewire
sh ~/pipewire-pulse.sh &

# Loop
while true; do
    dwm >/dev/null 2>&1
done

# Execute dwm
exec dwm > ~/.dwm.log

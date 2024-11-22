# Keyboard layout
# setxkbmap -model pc105 -layout us,ru -option grp:win_space_toggle
# https://superuser.com/questions/1429285/how-to-revert-keyboard-layout-switching-shortcuts-after-setting-them-with-xkbs
setxkbmap -option
setxkbmap -model pc105 -layout us,ru -option grp:caps_toggle
# setxkbmap -model pc105 -layout p-us,ru -option grp:alt_shift_toggle,caps:super
# xbindkeys
sxhkd &

#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Run slstatus
slstatus &

# Hide the mouse coursor after 3 seconds of inactivity
unclutter -idle 3 &

# run remind daemon and popup notifications
ps aux | grep -q [r]emind || setsid remind -z -k'dunstify -t 0 %s' ~/.reminders/ &

# Start pipewire
sh ~/pipewire-pulse.sh &

# exec herbstluftwm --locked

# Loop
while true; do
    dbus-launch --sh-syntax --exit-with-session dwm >/dev/null 2>&1
done

# Execute dwm
exec dwm > ~/.dwm.log

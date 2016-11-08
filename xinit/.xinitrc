[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys
setxkbmap -variant altgr-intl -option compose:rctrl -option caps:ctrl_modifier

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

/usr/bin/start-pulseaudio-x11 &
mopidy -q &
compton --backend glx --paint-on-overlay --vsync opengl-swc -b
srandrd ~/.config/detect_displays.sh
xscreensaver -no-splash &
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

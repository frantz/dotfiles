[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys
setxkbmap -variant altgr-intl -option compose:rctrl -option caps:ctrl_modifier
/usr/bin/start-pulseaudio-x11 &
mopidy -q &
compton --backend glx --paint-on-overlay --vsync opengl-swc -b
srandrd ~/.config/detect_displays.sh
xscreensaver -no-splash &
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

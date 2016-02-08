[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xbindkeys
/usr/bin/start-pulseaudio-x11 &
compton --backend glx --paint-on-overlay --vsync opengl-swc -b
srandrd ~/.config/detect_displays.sh
exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

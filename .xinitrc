dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
feh --bg-scale "$(find ~/.config/wallpapers -type f | shuf -n 1)" &
setxkbmap us &
flameshot &
exec i3

#!/bin/bash

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
feh --bg-scale "$(find ~/.config/wallpapers -type f | shuf -n 1)" &
setxkbmap us &
xset s off -dpms
flameshot &
exec i3

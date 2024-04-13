#!/bin/bash

#if [ "$(id -u)" -ne 0 ]; then
#  echo "setup.sh must be run as root" 1>&2
#  exit 1
#fi

# Update system
sudo apt update && sudo apt upgrade -y

# Install packages
packages=(
  xserver-xorg-core
  xserver-xorg-video-nouveau
  xserver-xorg-input-evdev
  x11-xserver-utils
  x11-xkb-utils
  x11-utils
  xinit
  i3
  alacritty
  chromium
  network-manager
  pavucontrol
  flameshot
  arandr
)

for package in "${packages[@]}"; do
  sudo apt install -y "$package"
done


cp -a .xinitrc ~/
cp -a .config ~/

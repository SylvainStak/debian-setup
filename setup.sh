#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
  echo "setup.sh must be run as root" 1>&2
  exit 1
fi

# Update system
apt update && apt upgrade -y

# Install packages
packages=(
  i3
  alacritty
)

for package in "${packages[@]}"; do
  apt install -y "$package"
done

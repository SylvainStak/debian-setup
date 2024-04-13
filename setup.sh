#!/bin/bash

# Ensuring the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Updating and upgrading the system
echo "Updating package lists..."
apt-get update
apt-get upgrade -y

# Installing i3 and alacritty
echo "Installing i3 and alacritty..."
apt-get install -y i3 alacritty

echo "Installation complete!"

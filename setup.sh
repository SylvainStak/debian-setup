#!/bin/bash

#if [ "$(id -u)" -ne 0 ]; then
#  echo "setup.sh must be run as root" 1>&2
#  exit 1
#fi

# Update system
sudo apt update && sudo apt full-upgrade -y

# Install packages
packages=(
  build-essential
  software-properties-common
  apt-transport-https
  ca-certificates
  linux-headers-$(uname -r)
  xserver-xorg-core
  xserver-xorg-video-nouveau
  xserver-xorg-input-evdev
  x11-xserver-utils
  x11-xkb-utils
  x11-utils
  xinit
  i3
  i3blocks
  alacritty
  chromium
  network-manager
  pavucontrol
  flameshot
  arandr
  thunar
  bat
  cmatrix
  tmux
  curl
  firefox-esr
  btop
  zathura
  tldr
  feh
  picom
  vlc
  thunderbird
  gimp
  libreoffice
  audacity
  ffmpeg
  ripgrep
  lolcat
  obs-studio
  jq
  fzf
  tree
  rsync
  locate
  ncdu
  neofetch
  cpufetch
  nmap
  figlet
  gdb
  valgrind
  clang
  make
  cmake
  wireshark
  speedtest-cli
  gparted
  lm-sensors
  nasm
  aircrack-ng
  lldb
  dunst
  lf
  blender
  xxd
  inkscape
  texlive-full
  nsxiv
  snapd
  cmus
)

for package in "${packages[@]}"; do
  sudo apt install -y "$package"
done

# Copy config files
cp -a .xinitrc ~/
cp -a .bash_profile ~/
cp -a .tmux.conf ~/
cp -a .config ~/


# Install JetbrainsMono Font
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"


mkdir -p ~/myapps


# Toipe
curl -s https://api.github.com/repos/Samyak2/toipe/releases/latest | jq -r '.assets[] | select(.name | test("linux.*\\.tar\\.gz$"; "i")) | .browser_download_url' | xargs curl -o toipe.tar.gz -L
mkdir -p toipe
mv toipe.tar.gz toipe/
tar -xvf toipe/toipe.tar.gz -C toipe/
mv toipe/toipe ~/myapps
mv toipe/randomword ~/myapps
rm -rf toipe/


# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y


# Discord
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install ./discord.deb
rm -rf discord.deb


# Skype
wget "https://go.skype.com/skypeforlinux-64.deb" -O skype.deb
sudo apt install ./skype.deb
rm -rf skype.deb


# Visual Studio Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
sudo apt install ./vscode.deb
rm -rf vscode.deb


# Docker
sudo apt update
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


# Snap packages
sudo snap install pycham-professional --classic
sudo snap install postman
sudo snap install spotify


# Default apps
xdg-mime default vlc.desktop video/*
xdg-mime default nsxiv.desktop image/*
xdg-mime default sublime_text.desktop text/*
xdg-mime default org.pwmt.zathura-pdf-poppler.desktop application/pdf
xdg-settings set default-web-browser chromium.desktop

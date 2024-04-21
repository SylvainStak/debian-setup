#!/bin/bash

# Update system
sudo apt update && sudo apt full-upgrade -y

# Install packages
packages=(
  build-essential
  software-properties-common
  apt-transport-https
  ca-certificates
  linux-headers-$(uname -r)
  firmware-linux
  firmware-linux-nonfree
  keychain
  cups
  printer-driver-cups-pdf
  bluetooth
  blueman
  stress
  yad
  xdotool
  iw
  locales-all
  libc6-i386
  libc6-x32
  default-jdk
  xserver-xorg-core
  xserver-xorg-video-nvidia
  xserver-xorg-input-evdev
  x11-xserver-utils
  x11-xkb-utils
  x11-utils
  xinit
  xclip
  python3
  python3-venv
  python3-pip
  i3
  i3blocks
  alacritty
  vim
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
  conky
  guvcview
  nvtop
)

for package in "${packages[@]}"; do
  sudo apt install -y "$package"
done

# Copy config files
cp -a .xinitrc ~/
cp -a .bash_profile ~/
cp -a .tmux.conf ~/
cp -a .bashrc ~/
cp -a .bash_aliases ~/
cp -a .gitconfig ~/
cp -a .vimrc ~/
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
sudo apt install ./discord.deb -y
rm -rf discord.deb


# Skype
wget "https://go.skype.com/skypeforlinux-64.deb" -O skype.deb
sudo apt install ./skype.deb -y
rm -rf skype.deb
rm -rf ~/.config/autostart/skypeforlinux.desktop


# Visual Studio Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
sudo apt install ./vscode.deb -y
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
sudo snap install pycharm-professional --classic
sudo snap install postman


# Radare2
git clone https://github.com/radareorg/radare2 ~/myapps/radare2
/bin/bash ~/myapps/radare2/sys/install.sh


# Ghidra
sudo apt install openjdk-17-jdk -y
curl -s https://api.github.com/repos/NationalSecurityAgency/ghidra/releases/latest | jq -r '.assets[] | select(.name | test("ghidra.*\\.zip$"; "i")) | .browser_download_url' | xargs curl -o ghidra.zip -L
unzip ghidra.zip -d ~/myapps
ln -s ~/myapps/ghidra_*/ghidraRun ~/myapps/ghidra
rm -rf ghidra.zip


# Obsidian
wget $(wget -q "https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest" -O - | jq -r '.assets[] | select(.name | endswith("_amd64.deb")) | .browser_download_url') -O obsidian.deb
sudo apt install ./obsidian.deb -y
rm -rf obsidian.deb


# Wireshark
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt -y install wireshark


# YT-DLP
wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O ~/myapps/yt-dlp
chmod a+rx ~/myapps/yt-dlp


# Conky config
git clone https://github.com/jxai/lean-conky-config ~/.config/conky


# Default apps
xdg-mime default vlc.desktop video/*
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop video/avi
xdg-mime default nsxiv.desktop image/*
xdg-mime default nsxiv.desktop image/png
xdg-mime default nsxiv.desktop image/jpeg
xdg-mime default nsxiv.desktop image/gif
xdg-mime default nsxiv.desktop image/tiff
xdg-mime default nsxiv.desktop image/bmp
xdg-mime default nsxiv.desktop image/webp
xdg-mime default nsxiv.desktop image/x-icon
xdg-mime default sublime_text.desktop text/plain
xdg-mime default org.pwmt.zathura-pdf-poppler.desktop application/pdf
xdg-settings set default-web-browser chromium.desktop

#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
mkdir -p ~/myapps

packages=(
  python3
  python3-venv
  python3-pip
  vim
  cmatrix
  bat
  git
  tmux
  curl
  keychain
  btop
  ripgrep
  jq
  fzf
  tree
  rsync
  neofetch
  cpufetch
  yt-dlp
  ffmpeg
  neovim
)
sudo apt install -y "${packages[@]}"

cp -a .bash_profile ~/
cp -a .tmux.conf ~/
cp -a .bashrc ~/
cp -a .bash_aliases ~/
cp -a .gitconfig ~/
cp -a .vimrc ~/
cp -a .config/nvim ~/

source ~/.bashrc

#!/bin/bash

echo "[INFO] Updating packages..."
sudo apt-get update && sudo apt-get uppgrade -y

echo "[INFO] Installing required (and additional) packages..."
sudo apt-get install -y \
             curl \
             git \
             stow \
             tmux \
             tree \
             vim \
             zsh
echo "       => Done!"
			 
echo "[INFO] Creating SSH dir..."
mkdir -p $HOME/.ssh
touch $HOME/.ssh/known_hosts
echo "       => Done!"

echo "[INFO] Installing oh-my-zsh..."
chsh -s $(which zsh) && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "       => Done!"

echo "[INFO] Applying my dot files..."
cd $HOME/.dotfiles && sudo stow --adopt . && git restore .
echo "       => Done!"

echo "[INFO] Fixing git repository..."
cd $HOME/.dotfiles && git remote set-url origin git@github.com:betanzos/.dotfiles.git
echo "       => Done!"


echo "[INFO] Dot files setup finished!"
echo
echo
echo "Close the current session to apply all changes!"

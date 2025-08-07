#========================================================================
# Script name:  setup.sh
# Description:  This script is for setting up my environment in
#               Debian-based distros
#
# Author:       Eduardo Betanzos
# Email:        ebetanzos@outlook.com
#
# Usage:        sh -c "$(curl -sSL https://raw.githubusercontent.com/betanzos/.dotfiles/master/setup.sh)"
#
#
# Copyright © 2025  Eduardo Betanzos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#========================================================================


# ENSURE NEEDED PERMISSIONS
# Prevent run as root because sometimes when executed as root the
# script $HOME points to /root instead of the current user home dir
if [ $(id -u) -eq 0 ]; then
    echo "[ERROR] This script should not be running using sudo or as the root user"
	echo
    exit 1
fi

# Show sudo login in terminal
sudo -i echo

if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] Wrong password"
    echo
    exit 1
fi

echo


# UPDATE AND INSTALL PACKAGES
echo "[INFO] Updating packages..."
sudo apt-get update && sudo apt-get upgrade -y
echo "       => Done!\n"

echo "[INFO] Installing additional packages..."
sudo apt-get install -y \
             alacritty \
             curl \
             ffmpeg \
             gimp \
             git \
             neovim \
             qbittorrent \
             stow \
             tmux \
             tree \
             unzip \
             vlc \
             zsh
echo "       => Done!\n"


# SET UP MY ENVIRONMENT
echo "[INFO] Creating SSH dir..."
mkdir -p $HOME/.ssh
touch $HOME/.ssh/known_hosts
echo "       => Done!\n"

echo "[INFO] Installing oh-my-zsh..."
chsh -s $(which zsh) && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "       => Done!\n"

echo "[INFO] Downloading and applying my dot files..."
cd $HOME && \
git clone https://github.com/betanzos/.dotfiles.git && \
cd $HOME/.dotfiles && \
sudo stow --adopt . && \
git restore .
echo "       => Done!\n"

echo "[INFO] Fixing git repository..."
cd $HOME/.dotfiles && git remote set-url origin git@github.com:betanzos/.dotfiles.git
echo "       => Done!\n"


# ONLY FOR GNOME
if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    echo "[INFO] Customizing default GNOME settings..."
    gsettings set org.gnome.desktop.interface accent-color '"purple"' && \
    gsettings set org.gnome.desktop.interface clock-format '"24h"' && \
    gsettings set org.gnome.desktop.interface color-scheme '"prefer-dark"' && \
    gsettings set org.gnome.desktop.interface enable-animations false && \
    gsettings set org.gnome.desktop.interface enable-hot-corners false && \
    gsettings set org.gnome.desktop.wm.preferences num-workspaces 6 && \
    gsettings set org.gnome.mutter dynamic-workspaces false && \
    gsettings set org.gnome.shell.app-switcher current-workspace-only true && \
    gsettings set org.gnome.shell.window-switcher current-workspace-only true && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 '["<Super>1"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 '["<Super>2"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 '["<Super>3"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 '["<Super>4"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 '["<Super>5"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 '["<Super>6"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 '["<Super>7"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 '["<Super>8"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 '["<Super>9"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 '["<Super>0"]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 '["<Super><Shift>1"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 '["<Super><Shift>2"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 '["<Super><Shift>3"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 '["<Super><Shift>4"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 '["<Super><Shift>5"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 '["<Super><Shift>6"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 '["<Super><Shift>7"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 '["<Super><Shift>8"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 '["<Super><Shift>9"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 '["<Super><Shift>0"]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right '[]' && \
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-1 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-2 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-3 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-4 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-5 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-6 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-7 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-8 '[]' && \
    gsettings set org.gnome.shell.keybindings open-new-window-application-9 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-1 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-2 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-3 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-4 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-5 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-6 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-7 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-8 '[]' && \
    gsettings set org.gnome.shell.keybindings switch-to-application-9 '[]'
    echo "       => Done!\n"

    echo "[INFO] Installing GNOME packages..."
    sudo apt-get install -y \
                 dconf-editor \
                 gnome-shell-extension-manager \
                 gnome-tweaks \
                 pipx
    echo "       => Done!\n"

    echo "[INFO] Installing GNOME extensions..."
    sudo apt install pipx -y && \
    export PATH="$HOME/.local/bin:$PATH" && \
    pipx install gnome-extensions-cli --system-site-packages && \
    gext install disable-workspace-switcher-overlay@cleardevice \
                 space-bar@luchrioh
    echo "       => Done!\n"
fi


# SUCCESS MESSAGE
echo "[INFO] Dot files setup finished!"
echo
echo
echo "Close the current session to apply all changes!"

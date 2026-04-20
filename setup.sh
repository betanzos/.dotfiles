#========================================================================
# Script name:  setup.sh
# Description:  This script is for setting up my environment in
#               Debian-based distros
#
# Author:       Eduardo Betanzos
# Email:        ebetanzos@outlook.com
#
# Usage:        bash -c "$(curl -sSL https://raw.githubusercontent.com/betanzos/.dotfiles/master/setup.sh)"
#
#               or
#
#               bash -c "$(wget -q https://raw.githubusercontent.com/betanzos/.dotfiles/master/setup.sh -O -)"
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


# INCLUDES NEEDED SOURCES
. $HOME/.dotfiles/utils/distro.sh
. $HOME/.dotfiles/additional/install-packages.sh


# UPDATE AND INSTALL PACKAGES
. $HOME/.dotfiles/utils/distro.sh
distro=$(get_distro_id)
case "$distro" in
    debian) $(install_debian_packages) ;;

    opensuse-tumbleweed) $(install_opensuse_tumbleweed_packages) ;;

    *)
        echo "[ERROR] Setup failed. Unknown distro: " $distro
        exit 1
    ;;
esac


# SET UP MY ENVIRONMENT
echo "[INFO] INstalling sdkman..."
curl -s "https://get.sdkman.io?rcupdate=false" | bash
echo "       => Done!\n"

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
if [[ "$XDG_CURRENT_DESKTOP" =~ "GNOME" ]]; then  # non-posix test, it need bash
    sudo chmod +x $HOME/.dotfiles/additional/setup-gnome.sh
    $HOME/.dotfiles/additional/setup-gnome.sh
fi


# SUCCESS MESSAGE
echo "[INFO] Dot files setup finished!"
echo
echo
echo "---------------------------------"
echo "Log out to apply all changes!!!"
echo "---------------------------------"

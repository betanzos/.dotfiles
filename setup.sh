#========================================================================
# Script name:  setup.sh
# Description:  This script is for setting up my environment in
#               Debian and openSUSE Tumbleweed
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
# Copyright © 2026  Eduardo Betanzos
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

function main() {
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
    local distro=$(__get_distro_id)
    __upgrade_install_packages $distro || exit 1


    # SET UP MY ENVIRONMENT
    echo "[INFO] Installing sdkman..."
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
        __setup_gnome $distro || exit 1
    fi


    # SUCCESS MESSAGE
    echo "[INFO] Dot files setup finished!"
    echo
    echo
    echo "---------------------------------"
    echo "Log out to apply all changes!!!"
    echo "---------------------------------"
}

function __get_distro_id() {

    if [ -f /etc/os-release ]; then
        . /etc/os-release
        local distro=$ID
    else
        local distro="unknown"
    fi

    echo "${distro,,}"
}

function __upgrade_install_packages() {
    local distro=$1
    case "$distro" in
        debian) __install_packages_debian ;;

        opensuse-tumbleweed) __install_packages_opensuse_tumbleweed ;;

        *)
            echo "[ERROR] Installing distro-specific packages. Unknown distro: " $distro
            exit 1
        ;;
    esac
}

function __install_packages_debian() {
    echo "[INFO] Updating Debian packages..."
    sudo apt-get update && sudo apt-get upgrade -y
    echo "       => Done!\n"

    echo "[INFO] Installing additional Debian packages..."
    sudo apt-get install -y \
                 alacritty \
                 build-essential \
                 curl \
                 ffmpeg \
                 gimp \
                 git \
                 libgmp-dev \
                 neovim \
                 net-tools \
                 notepadqq \
                 qbittorrent \
                 stow \
                 tmux \
                 tree \
                 unzip \
                 vlc \
                 zip \
                 zsh
    echo "       => Done!\n"
}

function __install_packages_opensuse_tumbleweed(){
    echo "[INFO] Updating openSUSE Tumbleweeb packages..."
    sudo zypper refresh && sudo zypper update -y
    echo "       => Done!\n"

    echo "[INFO] Installing additional openSUSE Tumbleweeb packages..."
    sudo zypper install -y \
                alacritty \
                curl \
                ffmpeg-7 \
                gimp \
                git \
                neovim \
                net-tools \
                notepadqq \
                qbittorrent \
                showtime \
                stow \
                tmux \
                tree \
                unzip \
                vlc \
                zip \
                zsh
    echo "       => Done!\n"
}

function __setup_gnome() {
    # EXECUTE ONLY IF THE CURRENT DESKTOP IS GNOME
    if [[ "$XDG_CURRENT_DESKTOP" =~ "GNOME" ]]; then  # non-posix test, it need bash

        echo "[INFO] Customizing default GNOME settings..."
        gsettings set org.gnome.desktop.interface accent-color '"purple"'
        gsettings set org.gnome.desktop.interface clock-format '"24h"'
        gsettings set org.gnome.desktop.interface color-scheme '"prefer-dark"'
        gsettings set org.gnome.desktop.interface enable-animations false
        gsettings set org.gnome.desktop.interface enable-hot-corners false
        gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
        gsettings set org.gnome.mutter dynamic-workspaces false
        gsettings set org.gnome.mutter overlay-key 'Super'
        gsettings set org.gnome.shell always-show-log-out true
        gsettings set org.gnome.shell.app-switcher current-workspace-only true
        gsettings set org.gnome.shell.window-switcher current-workspace-only true
        echo "       => Done!\n"    


        echo "[INFO] Creating my keybindings..."
        # misc
        gsettings set org.gnome.settings-daemon.plugins.media-keys search '["<Alt>space"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-windows '["<Alt>Tab"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-applications '[]'
        gsettings set org.gnome.settings-daemon.plugins.media-keys www '["<Super>b"]'
        gsettings set org.gnome.shell.keybindings show-screenshot-ui '["<Shift><Super>s"]'

        # switch active workspace
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 '["<Super>1"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 '["<Super>2"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 '["<Super>3"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 '["<Super>4"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 '["<Super>5"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 '["<Super>6"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 '["<Super>7"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 '["<Super>8"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 '["<Super>9"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 '["<Super>0"]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right '[]'
        gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up '[]'
        
        # move window to a workspace
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 '["<Super><Shift>1"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 '["<Super><Shift>2"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 '["<Super><Shift>3"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 '["<Super><Shift>4"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 '["<Super><Shift>5"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 '["<Super><Shift>6"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 '["<Super><Shift>7"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 '["<Super><Shift>8"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 '["<Super><Shift>9"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 '["<Super><Shift>0"]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right '[]'
        gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up '[]'
        
        # disable the opening of default applications
        gsettings set org.gnome.shell.keybindings open-new-window-application-1 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-2 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-3 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-4 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-5 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-6 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-7 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-8 '[]'
        gsettings set org.gnome.shell.keybindings open-new-window-application-9 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-1 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-2 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-3 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-4 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-5 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-6 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-7 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-8 '[]'
        gsettings set org.gnome.shell.keybindings switch-to-application-9 '[]'

        # custom keybindings
        ## open terminal
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name '"Open terminal"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command '"alacritty"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding '"<Super>Return"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings '["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"]'
        ## open file explorer
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name '"Open file explorer"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command '"nautilus"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding '"<Super>f"'
        dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings '["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"]'
        echo "       => Done!\n"
        echo "       => Done!\n"


        # INSTALL GNOME PACKAGES
        local distro=$1
        __install_packages_gnome $distro && \
        export PATH="$HOME/.local/bin:$PATH" && \
        echo "[INFO] Installing GNOME extensions..." && \
        pipx install gnome-extensions-cli --system-site-packages && \
        gext install disable-workspace-switcher-overlay@cleardevice \
                     space-bar@luchrioh \
                     just-perfection-desktop@just-perfection \
                     Bluetooth-Battery-Meter@maniacx.github.com \
                     appindicatorsupport@rgcjonas.gmail.com
        echo "       => Done!\n"


        echo "[INFO] Customizing GNOME appearance through extensions..."
        dconf write /org/gnome/shell/extensions/just-perfection/animation '0' # no animations
        dconf write /org/gnome/shell/extensions/just-perfection/clock-menu-position '1' #right
        dconf write /org/gnome/shell/extensions/just-perfection/top-panel-position '1' #bottom
        dconf write /org/gnome/shell/extensions/just-perfection/notification-banner-position '5' #bottom end
        dconf write /org/gnome/shell/extensions/space-bar/appearance/active-workspace-background-color '"rgb(145,65,172)"' #purple
        dconf write /org/gnome/shell/extensions/space-bar/behavior/scroll-wheel '"disabled"'
        dconf write /org/gnome/shell/extensions/space-bar/behavior/toggle-overview 'false'
        dconf write /org/gnome/shell/extensions/Bluetooth-Battery-Meter/enable-multi-indicator-mode 'true'
        dconf write /org/gnome/shell/extensions/Bluetooth-Battery-Meter/level-bar-position '2' # below
        echo "       => Done!"
    fi
}

function __install_packages_gnome() {
    local distro=$1
    case "$distro" in
        ubuntu|debian)
            echo "[INFO] Installing Debian-based pacakges for GNOME..."
            sudo apt-get install -y \
                        dconf-editor \
                        gnome-shell-extension-manager \
                        gnome-tweaks \
                        pipx
            echo "       => Done!\n"
        ;;

        opensuse-tumbleweed)
            echo "[INFO] Installing openSUSE-based pacakges for GNOME..."
            sudo zypper install -y \
                        dconf-editor \
                        extension-manager \
                        gnome-tweaks \
                        python314-pipx 
            echo "       => Done!\n"
        ;;

        *)
            echo "[ERROR] Execution of __install_gnome_packages function failed. Unknown distro: " $distro
            exit 1
        ;;
    esac
}


# RUN THE MAIN FUNCTION
main "$@"
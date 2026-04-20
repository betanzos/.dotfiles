function __install_debian_packages() {
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

function __install_opensuse_tumbleweed_packages(){
    echo "[INFO] Updating openSUSE Tumbleweeb packages..."
    sudo zypper refresh && sudo zypper update -y
    echo "       => Done!\n"

    echo "[INFO] Installing additional openSUSE Tumbleweeb packages..."
    sudo zypper install -y \
                alacritty \
                build-essential \
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

# Usage:
# upgrade_install_packages $distro
function upgrade_install_packages() {
    local distro=$1
    case "$distro" in
        debian) __install_debian_packages ;;

        opensuse-tumbleweed) __install_opensuse_tumbleweed_packages ;;

        *)
            echo "[ERROR] Installing distro-specific packages. Unknown distro: " $distro
            exit 1
        ;;
    esac
}

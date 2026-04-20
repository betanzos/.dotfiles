# ===========================================================================
# THE DISTRO ID IS EXPECTED TO BE RECEIVED AS THE FIRST PARAM OF THE SCRIPT
#
# Usage:
#   ./install-gnome-packages.sh debian
#
#============================================================================


if [ $# -gt 0 ]; then
    distro=$1
else
    echo "[ERROR] Invalid execution of 'install-gnome-packages.sh'. The distro-ID param is missing."
    exit 1
fi


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
        echo "[ERROR] GNOME pacakges installation failed. Unknown distro."
        exit 1
    ;;
esac

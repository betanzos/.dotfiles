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
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name '"Open terminal"'
    dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings '["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"]'
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
                 space-bar@luchrioh \
		 just-perfection-desktop@just-perfection \
		 pip-on-top@rafostar.github.com \
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
    dconf write /org/gnome/shell/extensions/pip-on-top/stick 'true'
    dconf write /org/gnome/shell/extensions/Bluetooth-Battery-Meter/enable-multi-indicator-mode 'true'
    dconf write /org/gnome/shell/extensions/Bluetooth-Battery-Meter/level-bar-position '2' # below
    echo "       => Done!"
fi


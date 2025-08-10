#!/bin/bash

# install and configure rclone
# we are assuming the user will configure a remote for Microsoft OneDrive named OneDrive
sudo bash -c "$(curl -s https://rclone.org/install.sh)"
rclone config && \


# create the directory where the OneDrive remote will be mounted in
mkdir -p ~/OneDrive && \


# create the script to mount OneDrive
echo "rclone --vfs-cache-mode full mount OneDrive: ~/OneDrive &" > ~/.mount-onedrive.sh && \
sudo chmod +x ~/.mount-onedrive.sh && \


# create the automount configuration (on user log in)
mkdir -p ~/.config/autostart && \

echo "[DESKTOP ENTRY]\n \
Name=onedrive-rclone\n \
GenericName=OneDrive rclone\n \
Comment=Auto mount OneDrive with rclone on log in\n \
Exec=$HOME/.mount-onedrive.sh\n \
Terminal=false\n \
Type=Application\n \
X-GNOME-Autostart-enabled=true" >> ~/.config/autostart/onedrive-rclone.desktop && \


# mount the OneDrive remote in the local filesystem
source ~/.mount-onedrive.sh &

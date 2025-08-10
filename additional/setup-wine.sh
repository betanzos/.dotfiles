sudo dpkg --add-architecture i386 && \
sudo mkdir -pm755 /etc/apt/keyrings && \
curl -sSL https://dl.winehq.org/wine-builds/winehq.key | sudo gpg -o /etc/apt/keyrings/winehq-archive.key --yes --dearmor - && \
sudo curl -sSL https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources -o /etc/apt/sources.list.d/winehq-trixie.sources  && \
sudo apt update && \
sudo apt install -y --install-recommends winehq-stable

echo "\nWine was successful installed!"

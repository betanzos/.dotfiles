## Install required packages

sudo apt update && \
sudo apt install -y \
         curl \
         git \
         stow \
         tmux \
         vim \
         zsh

## Make ZSH the default shell

chsh -s $(which zsh) 

## Install oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

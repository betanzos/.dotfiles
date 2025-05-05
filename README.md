# How to install my dot files

**1. Clone the git repository**

Since the repo is public it can be cloned via HTTPS without authentication. An alternative could be downloading the repository from the GitHub web.

```bash
cd $HOME && \
git clone https://github.com/betanzos/.dotfiles.git
```

**2. Execute the setup script**

This script will:

- Upgrade all already installed packages
- Install the following packages: `curl`, `git`, `stow`, `tmux`, `vim`, `zsh`
- Create the directory `$HOME/.ssh` and inside the file `known_hosts`
- Install Oh My Zsh
- Apply all the dot files by creating symbolic links (_Warning! Already existing files will be overridden_)
- Change the remove url for the `.dotfiles` repository to use the SSH variant

> [!WARNING]
> Make sure the `setup.sh` file has execution permissions

```bash
cd $HOME/.dotfiles && ./setup.sh
```

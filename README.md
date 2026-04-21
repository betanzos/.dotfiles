# How to setup your system like mine

**1. Run one of the following commands**
```bash
# If curl is already installed
bash -c "$(curl -sSL https://raw.githubusercontent.com/betanzos/.dotfiles/master/setup.sh)"
```

or

```bash
# If wget is already installed
bash -c "$(wget -q https://raw.githubusercontent.com/betanzos/.dotfiles/master/setup.sh -O -)"
```

> [!WARNING]
> So far this script is intended to be used in GNOME-based installations of Debian or openSUSE Tumbleweed


# What will happen to my system

## 1. Packages
Packages repositories will be updated/refreshed and all the installed packages will be updated
with newer versions.

In addition, the following packages will be installed (if missing).

### Debian
- alacritty
- build-essential
- curl
- ffmpeg
- gimp
- git
- libgmp-dev
- neovim
- net-tools
- notepadqq
- qbittorrent
- stow
- tmux
- tree
- unzip
- vlc
- zip
- zsh

### openSUSE Tumbleweed
- alacritty
- curl
- ffmpeg-7
- gimp
- git
- neovim
- net-tools
- notepadqq
- qbittorrent
- showtime
- stow
- tmux
- tree
- unzip
- vlc
- zip
- zsh

## 2. Other tools
In addition to the packages above, the script will install [SDKMAN!](https://sdkman.io/)
and [Oh My Zsh](https://ohmyz.sh/) with a custom configuration.

## 3. GNOME
I use GNOME in a way it looks like a tiling window manager but without the tiling features.

The main idea behind the way I use GNOME is to be able to quickly navigate to the place I need
by using the keyboard. So, I have 6 workspaces and, as a rule of thumb, I open only 1 application
in each one. Usually the exception to this rule is the workspace 1 which I use to open and close
thoese application that I need only for a brief period of time (for instance, the calculator). I
also have shortcuts that allow me to open some applications, switch from workspaces, and move a
winfow to a specific workspace in a smooth and fast way.

To have feedback about the number of available workspaces, the current one, and in which ones I
have open applications, I tweaked the top bar to have a i3-like look.

Because I prefer to see the result of my actions as quick as possible, I disabled all the
default animations.

### Extensions
Several of the experience described above is the result of using the following extensions
- [Disable workspace switcher overlay GNOME Shell 48, 49, 50 by cleardevice](https://extensions.gnome.org/extension/6358/disable-workspace-switcher-overlay/)
- [Space Bar by luchrioh](https://extensions.gnome.org/extension/5090/space-bar/)
- [Just Perfection by JustPerfection](https://extensions.gnome.org/extension/3843/just-perfection/)
- [Bluetooth Battery Meter by maniacx](https://extensions.gnome.org/extension/6670/bluetooth-battery-meter/)
- [AppIndicator and KStatusNotifierItem Support by rgcjonas](https://extensions.gnome.org/extension/615/appindicator-support/)

### Shortcuts
**Open aplications**
- Default browser: `Super+B`
- Screen capture: `Super+Shift+S`
- Terminal (alacritty): `Super+Return`
- Files: `Super+F`


**System navigation**
- Activities Overview: `Super`
- Run a command dialog: `Super+R`
- Switch between windows (current workspace only): `Alt+Tab`
- Switch to workspace: `Super+<workspace number>`
- Move focused windowd to workspace: `Super+Shift+<workspace number>`

## 4. Settings
As part of this process I also set up my dot files using `stow` + some custom settings through
using Oh My Zsh. Since this is my setup, you will need to review some of these settings in order
to make it work for you.

### .gitconfig
Update the `user.name` and `user.email` entries to use yours.

### SSH
The file `.my_custom/ssh.zsh` has some code to add my own key for GitHub to the SSH authentication
agent. This only happen in case the file exist. So, if the file is missing nothing will happen.

The `.ssh/config` file configure the same key as the key to be used with GitHub.
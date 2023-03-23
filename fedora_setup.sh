#!/bin/bash
printf "\n\n"
echo ===============WELCOME TO FEDORA SETUP===============
printf "\n\n"

echo Adding parallel downloads to DNF
sudo cat max_parallel_downloads=10 >>/etc/dnf/dnf.conf

# Installing fira code font
sudo dnf install fira-code-fonts

# Krita

sudo dnf install krita -y

echo Updating system...
sudo dnf upgrade --refresh -y

echo Installing XClip
sudo dnf install xclip -y

# Remove vim lite
sudo dnf remove vi -y

sudo dnf install mysql

# ZSH
sudo dnf install zsh -y
rm ~/.zshrc
ln -s ~/All-Dotfiles/zsh/.zshrc ~/.zshrc

# Kitty Terminal
sudo dnf install kitty -y
rm ~/.config/kitty/
ln -s ~/All-Dotfiles/kitty ~/.config/kitty/

echo Installing Gnome Tweaks and Extensions
sudo dnf install gnome-shell-extensions -y
sudo dnf install gnome-tweaks -y

echo Installing NCDU Disk Manager
sudo dnf install ncdu -y

echo Installing Theme
# Installing Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\n
echo Theme Installed
printf '\n\n\n'

echo Installing system applications
# Installing neovim
sudo dnf install -y libstdc++-static
sudo dnf install neovim -y

# Installing i3 and dependencies
sudo dnf install i3 i3status dmenu i3lock brightnessctl rofi
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git .config/i3/bumblebee-status

sudo dnf install fira-code-fonts
sudo dnf install ripgrep

sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
ln -s ~/All-Dotfiles/nvim ~/.config/nvim
printf '\n\n\n'

# Installing ranger
sudo dnf install ranger -y
printf '\n\n\n'

# Installing vlc
sudo dnf install vlc -y
printf '\n\n\n'

# Installing neofetch
sudo dnf install neofetch -y
printf '\n\n\n'

echo Installing Fuck
# Fuck
sudo dnf install fuck -y
printf '\n\n\n'

#oh-my-zsh plugins

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
printf '\n\n\n'

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
printf '\n\n\n'

# You should use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
printf '\n\n\n'

#Setup autojump
git clone https://github.com/wting/autojump.git ~
autojump/install.py
# Setup dotfiles
sudo rm ~/.zshrc
#omz reload

# Installing applications

# Flameshot
sudo dnf install flameshot -y
printf '\n\n\n'

# Steam
sudo dnf install steam -y
printf '\n\n\n'

# Setup flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

# Todoist
flatpak install flathub com.todoist.Todoist
printf '\n\n\n'

# Discord
flatpak install flathub com.discordapp.Discord -y
printf '\n\n\n'

# Install Telegram
flatpak install flathub org.telegram.desktop -y
printf '\n\n\n'

# Heroic Games launcher
flatpak install heroic -y
printf '\n\n\n'

# Install Joplin
flatpak install flathub net.cozic.joplin_desktop -y
printf '\n\n\n'

# Install qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent -y
printf '\n\n\n'

# Installing KDE
sudo dnf groupinstall "KDE Plasma Workspaces" -y
printf '\n\n\n'

# Setup SSH

#Github
ssh-keygen -t ed25519 -f /home/Biowulf21/.ssh/github -C "Github key"

cat ~/.ssh/github | xclip -selection c

# Install and setup zsh
#sudo dnf install zsh -y
#zsh --version
#sudo chsh -s $(which zsh)

#Install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printf '\n\n\n'

read -q "REPLY?Do you want to finish system installation?"

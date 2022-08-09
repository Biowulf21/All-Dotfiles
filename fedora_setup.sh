echo ===============WELCOME TO FEDORA SETUP===============
echo Updating system...
sudo dnf upgrade --refresh -y

echo Installing XClip
sudo dnf install xclip -y

# Remove vim lite
sudo dnf remove vi -y

# ZSH
sudo dnf install zsh -y
rm ~/.zshrc
ln -s ~/All-Dotfiles/zsh/.zshrc ~/.zshrc

echo Installing NCDU Disk Manager
sudo dnf install ncdu -y

echo Installing Theme
# Installing Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k\n
echo Theme Installed

echo Installing system applications
# Installing neovim
sudo dnf install -y libstdc++-static
sudo dnf install neovim -y
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Installing ranger
sudo dnf install ranger -y

# Installing vlc
sudo dnf install vlc -y

# Installing neofetch
sudo dnf install neofetch -y


echo Installing Fuck
# Fuck
sudo dnf install fuck -y

#oh-my-zsh plugins

# Autosuggestions
cd ~
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Fedora_35/shells:zsh-users:zsh-autosuggestions.repo
dnf install zsh-autosuggestions -y

# Syntax Highlighting
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/Fedora_Rawhide/shells:zsh-users:zsh-syntax-highlighting.repo
dnf install zsh-syntax-highlighting -y

# You should use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/oh-my-zsh/plugins/you-should-use

# Setup dotfiles
sudo rm ~/.zshrc
ln -s ~/.Dotfiles/zsh/.zshrc .zshrc
omz reload

# Installing applications

# Flameshot
sudo dnf install flameshot -y

# Steam
sudo dnf install steam -y


# Setup flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

# Todoist
flatpak install flathub com.todoist.Todoist

# Discord
flatpak install flathub com.discordapp.Discord -y

# Install Telegram
flatpak install flathub org.telegram.desktop -y

# Heroic Games launcher
flatpak install heroic -y

# Install Joplin
flatpak install flathub net.cozic.joplin_desktop -y

# Install qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent -y

# Installing KDE
sudo dnf groupinstall "KDE Plasma Workspaces" -y

# Setup SSH
ssh-keygen
cat ~/.ssh/id_rsa.pub | xclip -selection c 

# Install and setup zsh
#sudo dnf install zsh -y
#zsh --version
#sudo chsh -s $(which zsh)

#Install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


read -q "REPLY?Do you want to finish system installation?"


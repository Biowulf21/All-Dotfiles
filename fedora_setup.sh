echo ===============WELCOME TO FEDORA SETUP===============
echo Updating system...
sudo dnf upgrade --refresh -y

# Install and setup zsh
sudo dnf install zsh
zsh --version
sudo chsh -s $(which zsh)

#oh-my-zsh plugins

# Autosuggestions
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/Fedora_35/shells:zsh-users:zsh-autosuggestions.repo
dnf install zsh-autosuggestions

# Syntax Highlighting
dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/Fedora_Rawhide/shells:zsh-users:zsh-syntax-highlighting.repo
dnf install zsh-syntax-highlighting

# You should use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/oh-my-zsh/plugins/you-should-use




#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup dotfiles
sudo rm ~/.zshrc
ln -s ~/.Dotfiles/zsh/.zshrc .zshrc
omz reload

# Installing applications

# Flameshot
sudo dnf install flameshot

# Steam
sudo dnf install steam

# Setup flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org

# Install vscode
flatpak install flathub com.visualstudio.code

# Install Telegram
flatpak install flathub org.telegram.desktop

# Install Joplin
flatpak install flathub net.cozic.joplin_desktop

# Install qBittorrent
flatpak install flathub org.qbittorrent.qBittorrent

# Installing KDE
sudo dnf groupinstall "KDE Plasma Workspaces"

# Setup SSH
ssh-keygen
cat ~/.ssh/id_rsa.pub
read -q "REPLY?Do you want to finish system installation?"

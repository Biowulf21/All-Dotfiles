# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NOTES=$HOME/Notes/
export EDITOR=nvim
export VISUAL=nvim

export PATH="$PATH:/home/biowulf21/fvm/default/bin"
export PATH="$PATH:$HOME/flutter//bin/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"


# ZSH Configuration
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups
setopt hist_ignore_dups hist_save_no_dups hist_find_no_dups

# Keybinds
bindkey -e 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
# function command_not_found_handler {
#     local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
#     printf 'zsh: command not found: %s\n' "$1"
#     local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
#     if (( ${#entries[@]} )) ; then
#         printf "${bright}$1${reset} may be found in the following packages:\n"
#         local pkg
#         for entry in "${entries[@]}" ; do
#             local fields=( ${(0)entry} )
#             if [[ "$pkg" != "${fields[2]}" ]] ; then
#                 printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
#             fi
#             printf '    /%s\n' "${fields[4]}"
#             pkg="${fields[2]}"
#         done
#     fi
#     return 127
# }

# # Detect the AUR wrapper
# if pacman -Qi yay &>/dev/null ; then
#    aurhelper="yay"
# elif pacman -Qi paru &>/dev/null ; then
#    aurhelper="paru"
# fi
#
# function in {
#     local -a inPkg=("$@")
#     local -a arch=()
#     local -a aur=()
#
#     for pkg in "${inPkg[@]}"; do
#         if pacman -Si "${pkg}" &>/dev/null ; then
#             arch+=("${pkg}")
#         else 
#             aur+=("${pkg}")
#         fi
#     done
#
#     if [[ ${#arch[@]} -gt 0 ]]; then
#         sudo pacman -S "${arch[@]}"
#     fi
#
#     if [[ ${#aur[@]} -gt 0 ]]; then
#         ${aurhelper} -S "${aur[@]}"
#     fi
# }
#
source ~/aliases
#
#
# cdir (){
#   mkdir $1
#   cd $1
#   la
# }


# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'


# Init oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/All-Dotfiles/ohmyposh/base.toml)"

# Only run oh-my-posh if the terminal is not default Apple Terminal
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

#Display Pokemon
# pokemon-colorscripts --no-title -r 1,3,6


# Load zoxide
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# pnpm
export PNPM_HOME="/home/biowulf21/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

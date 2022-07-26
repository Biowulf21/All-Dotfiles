# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
neofetch


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

[[ -s /home/jamesjilhaney/.autojump/etc/profile.d/autojump.sh ]] && source /home/jamesjilhaney/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u


ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	bgnotify
	you-should-use $plugins
	copybuffer
	dirhistory
	history
	sudo
	git
)

source $ZSH/oh-my-zsh.sh

# copy with progress bar
alias cp='cp --progress-bar'
alias mv='mv --progress-bar'

export EDITOR=vim
alias la='ls -la'
alias setclip='xclip -selection c'
alias getclip='xclip -selection -o'
alias df='df -h'
alias stdwn='shutdown now'
alias rbt='reboot'
alias suu='sudo dnf update -y && sudo flatpak update -y'
alias dupdate=' sudo dnf update -y && sudo flatpak update -y'
# Turn on Bluetooth
alias bton='systemctl start bluetooth'
# Turn off Bluetooth
alias btoff='systemctl stop bluetooth'
alias r='. ranger'
alias nc='ncdu'
alias sa='sudo apt'
alias sapt='sudo dnf install'
alias sar='sudo dnf remove'
alias sap='sudo dnf purge'
alias ser='dnf search'
alias c='clear'
alias h='history'
alias b='cd ..'
alias tree='tree --dirsfirst -F'


# calendar
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# speedtest
alias sp='speedtest-cli'


# git
# View Git status.
alias gs='git status'

# Add a file to Git.
alias ga='git add'

# Add all files to Git.
alias gaa='git add --all'

# Commit changes to the code.
alias gc='git commit'

# View the Git log.
alias gl='git log --oneline'

# Create a new Git branch and move to the new branch at the same time.
alias gb='git checkout -b'

# View the difference.
alias gd='git diff'

# git push origin master
alias gpoms='git push origin master'

# git push
alias gp='git push'

#git push origin main
alias gpomn='git push origin main'

# git push origin
alias gpo='git push origin'

# git pull
alias gpl='git pull'

# flutter
alias frc='flutter run -d chrome'
alias few='flutter config --enable-web'

# finds the largest files
function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}


# goes up x number of directories based on argment passed
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
# Powerline
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


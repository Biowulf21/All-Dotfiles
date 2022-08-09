neofetch
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'



# ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	bgnotify
	you-should-use $plugins
	copybuffer
  copypath
	dirhistory
	history
	sudo
	git
  vi-mode
)

source $ZSH/oh-my-zsh.sh


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
alias sdnf='sudo dnf install'
alias sd='sudo dnf'
alias sdr='sudo dnf remove'
alias sdp='sudo dnf purge'
alias ser='dnf search'
alias fin='sudo flatpak install'
alias frm='sudo flatpak remove'
alias c='clear'
alias h='history'
alias b='cd ..'
alias tree='tree --dirsfirst -F'
alias cssh='cat ~/.ssh/id_rsa.pub | xclip -sel clip'

cl(){
  cd $@
  ls
}

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
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'

# echo current branch
alias cb='echo "$(git symbolic-ref --short HEAD)"'

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

cdir (){
  mkdir $1
  cd $1
  la
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Emulators and android studio
elist(){
/home/biowulf21/Android/Sdk/tools/emulator -list-avds

}

erun(){
 cd /home/biowulf21/Android/Sdk/tools/
 ./emulator -avd $1
}

as(){
  /usr/local/android-studio-2021.2.1.15-linux/android-studio/bin/studio.sh
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /home/biowulf21/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ -s /home/biowulf21/.autojump/etc/profile.d/autojump.sh ]] && source /home/biowulf21/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u


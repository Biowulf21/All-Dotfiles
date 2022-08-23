neofetch
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PATH="$PATH:/home/biowulf21/.development/flutter/bin"
export PATH="$PATH:~/.development/android-studio/bin"



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
source ./aliases


export EDITOR=vim

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

[[ -s /home/biowulf21/.autojump/etc/profile.d/autojump.sh ]] && source /home/biowulf21/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

source ~/powerlevel10k/powerlevel10k.zsh-theme

source /home/biowulf21/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


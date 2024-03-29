# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export PATH="usr/local/sbin:/usr/local/bin:/usr/sbin:/usr:/bin:/sbin:/bin"
export PATH="$PATH:/home/biowulf21/fvm/default/bin"
export PATH="$PATH:/home/$USER/flutter/bin"
export PATH="$PATH:/home/$USER/flutter/cache/dart-sdk/bin"
export PATH="$PATH:~/.development/android-studio/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.scripts/"
export PATH="$PATH:$HOME/.composer//"
export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:${PATH}
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:/$HOME/flutter/bin"
export PATH="$PATH:/usr/local/mysql-8.2.0-macos13-arm64/bin"
export PATH="$PATH:$HOME/.cargo/bin"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
	bgnotify
	you-should-use $plugins
	copybuffer
  copyfile
  copypath
	dirhistory
	history
	sudo
	git
  vi-mode
)

source $ZSH/oh-my-zsh.sh
source ~/All-Dotfiles/zsh/aliases


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

# eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[[ -s /home/biowulf21/.autojump/etc/profile.d/autojump.sh ]] && source /home/biowulf21/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/biowulf21/.dart-cli-completion/zsh-config.zsh ]] && . /home/biowulf21/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


 export PATH="$PATH":"$HOME/.puro/shared/pub_cache/bin"


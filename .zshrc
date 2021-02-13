# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

DISABLE_UPDATE_PROMPT="true"

DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git nvm)

NVM_LAZY=1

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=tobi

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add sudo before command with esc+esc
function prepend-sudo() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}

zle -N prepend-sudo

# defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" prepend-sudo

export PINENTRY_PROGRAM="pinentry-rofi"
export GUIX_PROFILE="$HOME/.guix-profile"
     . "$GUIX_PROFILE/etc/profile"
export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale

path+=/opt/android-studio/bin
path+=$HOME/scripts
path+=$HOME/bin
path+=$HOME/.config/guix/current/bin/guix
path+=$HOME/.cargo/bin
export PATH

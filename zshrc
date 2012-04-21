ZSH=$HOME/.oh-my-zsh
ZSH_THEME="random"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git python mercurial svn vi-mode)

if [[ `uname` == 'Darwin' ]]; then
    plugins=(osx $plugins)
fi

source $ZSH/oh-my-zsh.sh

source $HOME/.aliasrc

HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt share_history
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space

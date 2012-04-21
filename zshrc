ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wezm"
#ZSH_THEME="random"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode history-substring-search zsh-syntax-highlighting git python mercurial svn)

if [[ `uname` == 'Darwin' ]]; then
    plugins=(osx $plugins)
fi

source $ZSH/oh-my-zsh.sh

source $HOME/.aliasrc

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nicoulaj"
#ZSH_THEME="random"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(history-substring-search zsh-syntax-highlighting git python mercurial svn)

if [[ "$OSTYPE" == darwin* ]]; then
    plugins=(osx $plugins)
fi

source $ZSH/oh-my-zsh.sh

source $HOME/.aliasrc

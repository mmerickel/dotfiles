ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nicoulaj"
#ZSH_THEME="random"
DISABLE_AUTO_UPDATE="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(history-substring-search zsh-syntax-highlighting git python mercurial svn)

if [[ "$OSTYPE" == darwin* ]]; then
    plugins=(osx $plugins)
fi

source $ZSH/oh-my-zsh.sh

path=(/usr/local/bin $path)
path=($HOME/.pyenv27/bin $path)

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/Library/Frameworks/Python.framework/Versions/2.7/bin $path)
fi

source $HOME/.aliasrc
source $HOME/.zshrc.local

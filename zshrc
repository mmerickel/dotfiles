#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/Library/Frameworks/Python.framework/Versions/2.7/bin $path)
fi

path=(
    $HOME/.pyenv27/bin
    /usr/local/bin
    $path
)

if [[ -a "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
    source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

if [[ -a "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

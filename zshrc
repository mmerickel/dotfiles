#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Completion Paths
fpath=(
    $HOME/.zfunc
    /usr/local/share/zsh-completions
    $fpath
)

# Paths
path=(
    "$HOME/.bin"
    "$HOME/.local/bin"
    /usr/local/{bin,sbin}
    $path
)

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

# Aliases
if [[ -a "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
    source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

# Sandbox commands
if [[ -a "${ZDOTDIR:-$HOME}/.sandboxd" ]]; then
    source "${ZDOTDIR:-$HOME}/.sandboxd"
fi

# Local config
if [[ -a "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi

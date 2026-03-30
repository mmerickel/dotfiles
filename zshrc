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
    /opt/homebrew/share/zsh/site-functions
    /usr/local/share/zsh-completions
    $fpath
)

# do not require >! and >>!
setopt CLOBBER

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

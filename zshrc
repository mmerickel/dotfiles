#
# Executes commands at the start of an interactive session.
#

# do not require >! and >>!
setopt CLOBBER

# Completion Paths
fpath=(
    $HOME/.zfunc
    /opt/homebrew/share/zsh/site-functions
    /usr/local/share/zsh-completions
    $fpath
)

# load the pure prompt
autoload -U promptinit; promptinit
PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0
prompt pure

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

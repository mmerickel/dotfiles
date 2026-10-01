#
# Executes commands at login pre-zshrc.
#

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# map kubeconfig to KUBECONFIG
typeset -T KUBECONFIG kubeconfig :
export KUBECONFIG

# Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Homebrew, if installed
for brew in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew /usr/local/bin/brew; do
    if [[ -x "$brew" ]]; then
        eval "$("$brew" shellenv)"
        break
    fi
done
unset brew

# Set the list of directories that Zsh searches for programs.
path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.dotfiles/bin"
    $path
    /usr/local/{bin,sbin}
)

# Editors
VI='vi'
if type nvim > /dev/null; then
    VI='nvim'
elif type vim > /dev/null; then
    VI='vim'
fi
export VI
export EDITOR=$VI
export VISUAL=$VI
export PAGER='less'

#
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Local config
if [[ -a "${ZDOTDIR:-$HOME}/.zprofile.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile.local"
fi

#
# Executes commands at login pre-zshrc.
#

# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
if [[ -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]]; then
    export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
else
    export EDITOR='vi'
fi
export VISUAL=$EDITOR
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

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

# Temporary Files
TMPPREFIX="$(mktemp -d)/zsh"

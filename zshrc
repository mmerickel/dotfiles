# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Indicate the editor is not in insert mode.
#zstyle ':omz:module:editor:keymap' primary '>>>'
#zstyle ':omz:module:editor:keymap:primary' insert 'I'
#zstyle ':omz:module:editor:keymap:primary' overwrite 'O'
#zstyle ':omz:module:editor:keymap' alternate '<<<'

# Indicate the editor is completing.
zstyle ':omz:module:editor' completing '...'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
# The order matters.
zstyle ':omz:load' omodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'osx' \
  'prompt'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'nicoulaj'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

path=(/usr/local/bin $path)

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/Library/Frameworks/Python.framework/Versions/2.7/bin $path)
fi

path=($HOME/.pyenv27/bin $path)

source "$HOME/.aliasrc"
[[ -a "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

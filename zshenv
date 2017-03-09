#
# Defines environment variables.
#

# Local config
if [[ -a "${ZDOTDIR:-$HOME}/.zshenv.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshenv.local"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

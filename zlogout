#
# Executes commands at logout.
#

# Local config
if [[ -a "${ZDOTDIR:-$HOME}/.zlogout.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zlogout.local"
fi

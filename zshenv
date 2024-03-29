#
# Defines environment variables.
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PYENV_ROOT=$HOME/.pyenv
export NVM_DIR=$HOME/.nvm
export rvm_path=$HOME/.rvm

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# https://docs.amazonaws.cn/sdk-for-go/api/aws/credentials/processcreds/
# export AWS_SDK_LOAD_CONFIG=1

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

if [[ -a "$HOME/.local/cacerts.pem" ]]; then
    export REQUESTS_CA_BUNDLE=$HOME/.local/cacerts.pem
fi

# Local config
if [[ -a "${ZDOTDIR:-$HOME}/.zshenv.local" ]]; then
    source "${ZDOTDIR:-$HOME}/.zshenv.local"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

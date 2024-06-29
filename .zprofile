set -o vi

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

eval "$(ssh-agent -s)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

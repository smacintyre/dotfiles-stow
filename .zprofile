set -o vi

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

eval "$(ssh-agent -s)"

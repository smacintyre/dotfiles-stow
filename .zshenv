. "$HOME/.cargo/env"

export TZ=Asia/Bangkok
export EDITOR=nvim
export VISUAL=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export AWS_DEFAULT_OUTPUT=yaml

typeset -U path PATH
path=(~/.local/bin ~/.jenv/bin ~/.krew/bin /opt/homebrew/opt/postgresql@15/bin $path)
export PATH

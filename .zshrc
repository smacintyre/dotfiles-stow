# Startup Startship.rs
eval "$(starship init zsh)"

# k8s related configs
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# setup jenv
eval "$(jenv init -)"

# Standard alaises
alias awsd="source _awsd"
alias ls="eza"
alias vi="nvim"

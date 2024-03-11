[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/vim"
plug "zap-zsh/nvm"
plug "chrishrb/zsh-kubectl"
plug "wintermi/zsh-rust"
plug "wintermi/zsh-starship"
plug "zap-zsh/exa"

plug "Aloxaf/fzf-tab"
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

plug "junegunn/fzf-git.sh"
source $ZAP_PLUGIN_DIR/fzf-git.sh/fzf-git.sh
__fix_fzf_git_keybindings() {
  local m o
  for o in "$@"; do
    eval "fzf-git-$o-widget() { local result=\$(_fzf_git_$o | __fzf_git_join); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-git-$o-widget"
    for m in emacs vicmd viins; do
      eval "bindkey -M $m '^g^${o[1]}' fzf-git-$o-widget"
      eval "bindkey -M $m '^g${o[1]}' fzf-git-$o-widget"
    done
  done
}
__fix_fzf_git_keybindings files branches tags remotes hashes stashes lreflogs each_ref

# Load and initialise completion system
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# setup jenv
eval "$(jenv init -)"

# Standard alaises
alias awsd="source _awsd"
alias vi="nvim"
alias cat="bat"

stty -ixon

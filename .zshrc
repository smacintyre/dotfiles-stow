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

function auth_wrkr () {
  if [ -z "$GITLAB_ACCESS_TOKEN" ]; then
    echo authorizing wrkr - gitlab
    op signin --account complypath.1password.com
    export GITLAB_ACCESS_TOKEN=$(op item get GITLAB_ACCESS_TOKEN --account complypath.1password.com --fields notesPlain)
    export TF_TOKEN_gitlab_com=$GITLAB_ACCESS_TOKEN
  fi

  echo authorizing wrkr - aws nwo
  aws-sso-util login https://wrkr.awsapps.com/start ap-southeast-2
  export AWS_PROFILE=wrkr.sandbox-shawn-macintyre.ap-southeast-2.AWSAdministratorAccess
  export TFENV_TERRAFORM_VERSION=1.5.7
}

function start_wrkr () {
  auth_wrkr
  tmuxinator start wrkr
}

# pnpm
export PNPM_HOME="/Users/smacintyre/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

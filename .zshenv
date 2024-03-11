export TZ=Asia/Bangkok
export EDITOR=nvim
export VISUAL=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export AWS_DEFAULT_OUTPUT=yaml

typeset -U path PATH
path=(~/.local/bin ~/.jenv/bin ~/.krew/bin /opt/homebrew/opt/postgresql@15/bin $path)
export PATH

export FZF_TMUX_OPTS='
  -p80%,60%
  --preview-window=down
  '
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color=dark
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
  --layout=reverse
  --info=inline
  --border
  --margin=1
  --padding=1
  '

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  "

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
  "

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/slss.bash ] && . /Users/smacintyre/.config/yarn/global/node_modules/tabtab/.completions/slss.bash

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

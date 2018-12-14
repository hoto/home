export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bullet-train"

plugins=(
  git
)

# https://github.com/caiogondim/bullet-train.zsh
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    #context
    dir
    #screen
    #aws
    git
    cmd_exec_time
  )

source $ZSH/oh-my-zsh.sh
emulate sh -c 'source ${HOME}/.profile'

### SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

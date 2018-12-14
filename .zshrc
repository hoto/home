#!/usr/bin/env zsh

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
export BULLETTRAIN_TIME_BG=yellow
export BULLETTRAIN_GIT_BG=yellow
export BULLETTRAIN_GIT_DIRTY=" %F{red}★%F{black}"
export BULLETTRAIN_GIT_ADDED=''
export BULLETTRAIN_GIT_MODIFIED=''
export BULLETTRAIN_GIT_DELETED=''
export BULLETTRAIN_GIT_UNTRACKED=''
export BULLETTRAIN_GIT_RENAMED=''
export BULLETTRAIN_GIT_UNMERGED=''
export BULLETTRAIN_GIT_AHEAD=''
export BULLETTRAIN_GIT_BEHIND=''
export BULLETTRAIN_GIT_DIVERGED=''

source $ZSH/oh-my-zsh.sh
emulate sh -c 'source ${HOME}/.profile'

### SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

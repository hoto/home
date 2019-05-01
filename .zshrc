#!/usr/bin/env zsh

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bullet-train"

plugins=(
  git
  virtualenv
)

# https://github.com/caiogondim/bullet-train.zsh
BULLETTRAIN_PROMPT_ORDER=(
    virtualenv
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
export BULLETTRAIN_DIR_EXTENDED=2 # 0=short, 1=medium, 2=complete
export BULLETTRAIN_TIME_BG=yellow
export BULLETTRAIN_GIT_BG=yellow
export BULLETTRAIN_GIT_DIRTY=" %F{red}★%F{black}"
export BULLETTRAIN_GIT_CLEAN=''
export BULLETTRAIN_GIT_ADDED=''
export BULLETTRAIN_GIT_MODIFIED=''
export BULLETTRAIN_GIT_DELETED=''
export BULLETTRAIN_GIT_UNTRACKED=''
export BULLETTRAIN_GIT_RENAMED=''
export BULLETTRAIN_GIT_UNMERGED=''
export BULLETTRAIN_GIT_AHEAD=''
export BULLETTRAIN_GIT_BEHIND=''
export BULLETTRAIN_GIT_DIVERGED=''
export BULLETTRAIN_VIRTUALENV_BG='green'
export BULLETTRAIN_VIRTUALENV_FG='black'
export BULLETTRAIN_VIRTUALENV_PREFIX='(env)'

source $ZSH/oh-my-zsh.sh
emulate sh -c 'source ${HOME}/.profile'

### HSTR
export HISTFILE=~/.zsh_history
bindkey -s "\C-r" "\C-a hh -- \C-j"

### SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

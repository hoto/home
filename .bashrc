#!/usr/bin/env bash

source "${HOME}/.profile"

### ALIASES
alias colors='perl .bash/256colors2.pl'

### PS1
BASH_SCRIPTS=${HOME}/.bash
source ${BASH_SCRIPTS}/ps1.sh

### HSTR
export HISTFILE=~/.bash_history
shopt -s histappend # append new history items to .bash_history
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi # bind to ctrl-r if interactive mode

### SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

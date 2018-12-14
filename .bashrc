#!/usr/bin/env bash

source "${HOME}/.profile"

### ALIASES
alias colors='perl .bash/256colors2.pl'

### PS1
BASH_SCRIPTS=${HOME}/.bash
source ${BASH_SCRIPTS}/ps1.sh

### HSTR (CTRL + R history enhancer) https://github.com/dvorka/hstr
shopt -s histappend              # append new history items to .bash_history
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi # if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)

### SDKMAN
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

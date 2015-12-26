# GIT ALIASES
alias g="cd ~/git ; ls -la"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"

alias sv1="cd ${HOME}/git/typester"


# UTIL ALIASES
alias l='ls -la --color'
alias h='function _hg(){ history | grep $1 -i; };_hg'

# SCRIPTS
source ${HOME}/scripts/maven-color.sh

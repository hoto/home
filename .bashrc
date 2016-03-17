# GIT ALIASES
alias g="cd ~/git ; ls -la"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gp="cat ~/.gittoken | xclip; git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"

alias sv1="cd ${HOME}/git/typester"
alias sv2="cd ${HOME}/git/funfun"


# UTIL ALIASES
alias l='ls -las --color --group-directories-first'
alias c='clear'
alias h='function _hg(){ history | grep $1 -i; };_hg'
alias colors='perl .bash/256colors2.pl'
alias grep='grep -n --color'


# SCRIPTS
BASH_SCRIPTS=${HOME}/.bash
export GITAWAREPROMPT=${BASH_SCRIPTS}/git-aware-prompt
source ${BASH_SCRIPTS}/maven-color.sh
source ${GITAWAREPROMPT}/main.sh


# PS1
export PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Map capslock key to escape key
setxkbmap -option caps:escape

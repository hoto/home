# UTIL ALIASES
alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -las'
alias ll='la'
alias colors='perl .bash/256colors2.pl'
alias grep='grep -n --color'
alias tree='tree -C'

# TREE
function _tree(){ if [[ -z "$1" ]]; then tree; else tree -L $1; fi }
alias t=_tree
alias t0='_tree 1'
alias t1='_tree 1'
alias t2='_tree 2'
alias t3='_tree 3'
alias t4='_tree 4'

# GIT ALIASES
alias g="cd ~/git; tree -L 2 -d"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff --unified=0 --color=always --word-diff=color"
alias gds="gd --staged"
alias gp="cat ~/.gittoken | xclip; git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"

# DOCKER ALIASES
alias d='docker'
alias di='docker images'
alias dsr='docker ps'
alias ds='dsr --all'
alias dp='ds'
alias dc='docker-compose'

# SCRIPTS
BASH_SCRIPTS=${HOME}/.bash
export GITAWAREPROMPT=${BASH_SCRIPTS}/git-aware-prompt
source ${GITAWAREPROMPT}/main.sh
source /usr/share/bash-completion/completions/git
source ${BASH_SCRIPTS}/git-completion.sh

# AWS 
complete -C '/usr/local/aws/bin/aws_uompleter' aws 2>&-

# PS1
function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "[1] "
}
export PS1="\[$bakblu\]\[$txtblk\]\t \[$txtwht\]\w \[$txtrst\]\[$bakylw\]\[$txtblk\]\$git_branch\[$txtrst\]\[$txtred\]\$git_dirty\[$txtrst\]\$ \[$txtred\]\$(nonzero_return)\[$txtrst\]"
#export PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Map capslock key to escape key
setxkbmap -option caps:escape

# Ignore changes in ubuntu terminal profiles (because of timestamps being updated there)
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml 2>&-
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Profile0/%gconf.xml 2>&-


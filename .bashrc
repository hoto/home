# UTIL ALIASES
alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -las'
alias colors='perl .bash/256colors2.pl'
alias grep='grep -n --color'
alias tree='tree -C'
alias t='tree'

# GIT ALIASES
alias g="cd ~/git; ls"
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
alias dc='docker-compose'

# SCRIPTS
BASH_SCRIPTS=${HOME}/.bash
export GITAWAREPROMPT=${BASH_SCRIPTS}/git-aware-prompt
source ${GITAWAREPROMPT}/main.sh

# PS1
export PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Map capslock key to escape key
setxkbmap -option caps:escape

# Ignore changes in ubuntu terminal profiles (because of timestamps being updated there)
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml 2>&-
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Profile0/%gconf.xml 2>&-

# Command competion for AWS CLI
complete -C '/usr/local/aws/bin/aws_completer' aws 2>&-

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
alias t0='_tree'
alias t='_tree 1'
alias t1='_tree 2'
alias t2='_tree 3'
alias t3='_tree 4'
alias t4='_tree 5'
alias t5='_tree 6'
alias tt='t5'

# GIT ALIASES
alias g="cd ~/git; tree -L 2 -d"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff --unified=0 --color=always --word-diff=color"
alias gds="gd --staged"
alias gp="cat ~/.gittoken | xclip; git push"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"

# ALIASES
alias inform='cd ~/git/cckrk/inform'
alias inform2='cd ~/git/cckrk/inform-cloudfront-distribution'
alias i='inform'
alias i2='inform2'
alias vault='cd ~/git/vault/vault-core'
alias vault2='cd ~/git/vault/vault-devops'
alias v='vault'
alias v2='vault2'

# DOCKER ALIASES
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias dpa='dp --all'
alias dc='docker-compose'

# SOURCE OTHER SCRIPTS
BASH_SCRIPTS=${HOME}/.bash
source ${BASH_SCRIPTS}/ps1.sh
source /usr/share/bash-completion/completions/git

# Map capslock key to escape key
setxkbmap -option caps:escape

# Ignore changes in ubuntu terminal profiles (because of timestamps being updated there)
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Default/%gconf.xml 2>&-
git update-index --assume-unchanged ${HOME}/.gconf/apps/gnome-terminal/profiles/Profile0/%gconf.xml 2>&-

# Colors for 'man'
export PAGER=less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;31m') # enter standout (searched phrase) mode - red 
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# run 'time' before a command when executing it with Ctlr+j
export TIMEFORMAT='r: %R, u: %U, s: %S'
bind '"\C-j": "\C-atime \C-m"'

# Enable 'minimise on click'
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

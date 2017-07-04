# UTIL ALIASES
alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -lash'
alias ll='la'
alias colors='perl .bash/256colors2.pl'
alias grep='grep --ignore-case --line-number --color'
function grep_highlight() {
  grep -E "$1|\$"
}
alias greph='grep_highlight'
alias tree='tree -C'
alias e='exit'
alias ex='e'
alias terminal='tilix'
alias ter='tilix && exit'
alias des='cd ~/Desktop'
alias exp='nautilus --browser .'
alias expl='exp'
alias cp='cp -i'
alias mv='mv -i'
alias ports='sudo lsof -i -n -P | grep TCP'
alias c='~/envs/pygmentize/bin/pygmentize -g'
alias stat='/usr/bin/stat --format "%a %U %G %n [%F]"'
alias googler='googler -n 3'
alias ack='ack -i'
alias acki='/usr/bin/ack'
alias ackf='ack -f | ack -i'
alias du='du -h'
function open_chrome() {
  local url=$1
  google-chrome ${url} &
  exit
}
alias ch=open_chrome
alias gm='open_chrome https://mail.google.com/mail/u/0/'
alias gmm='open_chrome https://mail.google.com/mail/u/1/'
alias lastpass='lpass'
function set_backlight() {
  xbacklight -set $1
}
alias b='set_backlight'
alias diff='webstorm diff'
alias k='kubectl'
alias o='xdg-open'

# GIT ALIASES
alias gg="cd ~/projects; tree -L 1 -d"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff --unified=0 --color=always --word-diff=color"
alias gds="gd --staged"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold magenta)%an%Creset %Cgreen%cr' --abbrev-commit"
alias gsm="git submodule"
function git_hash() {
  local n=${1:-'3'}
  git log --pretty=format:'%h' -n ${n}
}
function git_hash_colorized() {
  echo -e "$( \
      git_hash $1 | \
      sed '1 s/^/\\\e[35m/g' | \
      sed '1 s/$/\\\e[0m /g' | \
      sed '2~1 s/6/\\\e[96m6\\e[0m/g' | \
      awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' \
    )"
}
alias gh="git_hash_colorized"
function git_push() {
  git push --set-upstream origin $(echo $git_branch)
}
alias gp="git_push"

# TREE
function _tree(){
  local n=${1:='1'}
  tree -L $n -I ".git|node_modules|.idea|bower_components|coverage|.gradle" -a
}
alias t='_tree 1'
alias t0='_tree'
alias t1='_tree 1'
alias t2='_tree 2'
alias t3='_tree 3'
alias t4='_tree 4'
alias t5='_tree 5'
alias tt='t5'

# ANSIBLE ALIASES
alias an='ansible'
alias ap='ansible-playbook'

# PROJECTS ALIASES
alias ans='cd ~/projects/hoto/ansible-home-fedora'
alias home='cd ~/projects/hoto/home'
function go_to_project() {
  local pattern=$1
  fuzzy-project-finder ${pattern}
  local selectedProjectPath=$(cat ~/.fuzzy-project-finder/.projects)
  cd ${selectedProjectPath}
}
alias g='go_to_project'
#alias g='cd ~/projects; find ~/projects -maxdepth 2 -type d -printf "%P\n" | /bin/grep --color '

# SSH ALIASES
alias frogs='ssh -At develop ssh -At develop-node17-worker fleetctl ssh tipservice@1'

# SOFTWARE
alias wn='webstorm . &'
alias w='(wn) && exit'
alias in='idea . &'
alias i='(in) && exit'
alias pn='charm . &'
alias p='(pn) && exit'
alias an='nohup atom -a . > /dev/null'
alias a='an && exit'
alias vn='code . &'
alias v='(vn) && exit'

# DOCKER ALIASES
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias dpa='dp --all'
alias dc='COMPOSE_HTTP_TIMEOUT=99999 docker-compose'

# XCLIP
alias xclip='xclip -selection primary -f | xclip -selection clipboard -f'

# SOURCE OTHER SCRIPTS
BASH_SCRIPTS=${HOME}/.bash
source ${BASH_SCRIPTS}/ps1.sh
source /usr/share/bash-completion/completions/git

# Map capslock key to escape key
setxkbmap -option caps:escape

# Colors for 'man'
export PAGER=less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;31m') # enter standout (searched phrase) mode - red
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Load ssh keys to ssh-agent
ssh-add ~/.ssh/pubbutt.pem &>/dev/null || :

# YARN
export PATH="$HOME/.yarn/bin:$PATH"

# NPM GLOBAL MODULES
export PATH="$HOME/.npm-global/bin:$PATH"

# Enable mixu/gr completeion 
. <(gr completion)

# EXPORTS
export EDITOR=vim
export TIMEFORMAT='r: %R, u: %U, s: %S'

# HSTR (CTRL + R history enhancer) 
# https://github.com/dvorka/hstr
export HH_CONFIG=hicolor,rawhistory # get more colors and sort by date
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

# there is this stupid warning on fedora sometimes 
__vte_prompt_command() { true; }
export GOPATH=$HOME/go

# JAVA
export JAVA_HOME=/usr/java/jdk1.8.0_131

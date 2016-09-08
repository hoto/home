# UTIL ALIASES
alias ls='ls --color --group-directories-first'
alias l='ls'
alias la='ls -las'
alias ll='la'
alias colors='perl .bash/256colors2.pl'
alias grep='grep -n --color'
alias tree='tree -C'
alias e='exit'
alias ex='e'
alias terminal='gnome-terminal'
alias ter='terminal $$ exit'
alias des='cd ~/Desktop'
alias exp='nautilus --browser .'
alias expl='exp'

# GIT ALIASES
alias gg="cd ~/git; tree -L 2 -d"
alias gc="git commit -m"
alias ga="git add -A"
alias gs="git status"
alias gd="git diff --unified=0 --color=always --word-diff=color"
alias gds="gd --staged"
alias gpp="cat ~/.gittoken | xclip; git push"
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
function git_push_origin() {
  cat ~/.gittoken | xclip
  git push -u origin $git_branch
}
alias gp="git_push_origin"

# TREE
function _tree(){
  local n=${1:='1'}
  tree -L $n
}
alias t='_tree 1'
alias t0='_tree'
alias t1='_tree 2'
alias t2='_tree 3'
alias t3='_tree 4'
alias t4='_tree 5'
alias t5='_tree 6'
alias tt='t5'

# torm . &) && exitLIASES
alias i='cd ~/git/cckrk/inform'
alias tip='cd ~/git/cckrk/tipservice'
alias rec='cd ~/git/cckrk/recipientservice'
alias web='cd ~/git/cckrk/webtip'
alias tipm='cd ~/git/cckrk/tipmanager'
alias v='cd ~/git/vault/ccvault.core'
alias f='cd ~/git; find ~/git -maxdepth 2 -type d -printf "%P\n" | /bin/grep --color '
alias g='f'
alias w='(wstorm . &) && exit'
alias a='nohup atom -a . > /dev/null && exit'

# DOCKER ALIASES
alias d='docker'
alias di='docker images'
alias dp='docker ps'
alias dpa='dp --all'
alias dc='docker-compose'

# XCLIP
alias xclip='xclip -selection primary -f | xclip -selection clipboard -f'

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

# Change screenshots default save directory
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Desktop/"

# Load ssh keys to ssh-agent
ssh-add ~/.ssh/andrzej-rehmann-dellm4600-ubuntu.priv &>/dev/null || :

# RUBY ON RAILS
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
